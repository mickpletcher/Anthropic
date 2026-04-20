<#
.SYNOPSIS
    Packages a Claude skill folder into a distributable .skill file.

.DESCRIPTION
    Validates the skill folder structure and SKILL.md frontmatter, then creates
    a ZIP-based .skill file ready for upload to Claude.ai or distribution.
    Replicates the behavior of the Anthropic package_skill.py and quick_validate.py
    scripts from the skill-creator toolkit.

.PARAMETER SkillPath
    Path to the skill folder containing SKILL.md.

.PARAMETER OutputDirectory
    Directory where the .skill file will be written. Defaults to the current directory.

.PARAMETER AsZip
    Output a .zip file instead of a .skill file. Use this for direct Claude.ai upload.

.EXAMPLE
    .\Invoke-PackageSkill.ps1 -SkillPath 'C:\Skills\resume-writer'

.EXAMPLE
    .\Invoke-PackageSkill.ps1 -SkillPath 'C:\Skills\resume-writer' -OutputDirectory 'C:\Output' -AsZip

.NOTES
    ===========================
    Created on:   04/19/2026
    Created by:   Mick Pletcher
    Organization:
    Filename:     Invoke-PackageSkill.ps1
    ===========================
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$SkillPath,

    [Parameter(Mandatory = $false)]
    [string]$OutputDirectory,

    [Parameter(Mandatory = $false)]
    [switch]$AsZip
)

#region Functions

function Write-CMTraceLog {
    <#
    .SYNOPSIS
        Writes a CMTrace-compatible log entry to the console and optionally a log file.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [Parameter(Mandatory = $false)]
        [ValidateSet('Info', 'Warning', 'Error')]
        [string]$Severity = 'Info'
    )

    $typeMap = @{ 'Info' = 1; 'Warning' = 2; 'Error' = 3 }
    $type = $typeMap[$Severity]
    $now = Get-Date
    $timeString = $now.ToString('HH:mm:ss.fff+000')
    $dateString = $now.ToString('MM-dd-yyyy')
    $component = 'Invoke-PackageSkill'

    $logEntry = "<![LOG[$Message]LOG]!><time=`"$timeString`" date=`"$dateString`" component=`"$component`" context=`"`" type=`"$type`" thread=`"`" file=`"`">"

    switch ($Severity) {
        'Info'    { Write-Host $Message }
        'Warning' { Write-Warning $Message }
        'Error'   { Write-Error $Message }
    }

    Write-Verbose $logEntry
}

function Test-SkillFrontmatter {
    <#
    .SYNOPSIS
        Validates the YAML frontmatter in SKILL.md.
        Replicates the logic from quick_validate.py.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [System.IO.FileInfo]$SkillMd
    )

    $allowedKeys     = @('name', 'description', 'license', 'allowed-tools', 'metadata', 'compatibility')
    $rootExcludeDirs = @('evals')

    try {
        $content = Get-Content -Path $SkillMd.FullName -Raw -ErrorAction Stop
    } catch {
        return @{ Valid = $false; Message = "Could not read SKILL.md: $_" }
    }

    if (-not $content.TrimStart().StartsWith('---')) {
        return @{ Valid = $false; Message = 'No YAML frontmatter found' }
    }

    $match = [regex]::Match($content, '^---\r?\n(.*?)\r?\n---', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $match.Success) {
        return @{ Valid = $false; Message = 'Invalid frontmatter format' }
    }

    $frontmatterText = $match.Groups[1].Value
    $frontmatter = @{}

    foreach ($line in ($frontmatterText -split '\r?\n')) {
        $line = $line.Trim()
        if ($line -eq '' -or $line.StartsWith('#')) { continue }

        if ($line -match '^([^:]+):\s*(.*)$') {
            $key   = $Matches[1].Trim()
            $value = $Matches[2].Trim()
            $frontmatter[$key] = $value
        }
    }

    # Check for unexpected keys
    $unexpectedKeys = $frontmatter.Keys | Where-Object { $_ -notin $allowedKeys }
    if ($unexpectedKeys) {
        $unexpected = ($unexpectedKeys | Sort-Object) -join ', '
        $allowed    = ($allowedKeys | Sort-Object) -join ', '
        return @{ Valid = $false; Message = "Unexpected key(s) in frontmatter: $unexpected. Allowed: $allowed" }
    }

    # Require name
    if (-not $frontmatter.ContainsKey('name')) {
        return @{ Valid = $false; Message = "Missing 'name' in frontmatter" }
    }

    # Require description
    if (-not $frontmatter.ContainsKey('description')) {
        return @{ Valid = $false; Message = "Missing 'description' in frontmatter" }
    }

    # Validate name format (kebab-case)
    $name = $frontmatter['name'].Trim()
    if ($name -notmatch '^[a-z0-9-]+$') {
        return @{ Valid = $false; Message = "Name '$name' must be kebab-case (lowercase letters, digits, and hyphens only)" }
    }
    if ($name.StartsWith('-') -or $name.EndsWith('-') -or $name -match '--') {
        return @{ Valid = $false; Message = "Name '$name' cannot start or end with a hyphen or contain consecutive hyphens" }
    }
    if ($name.Length -gt 64) {
        return @{ Valid = $false; Message = "Name is too long ($($name.Length) characters). Maximum is 64." }
    }

    # Validate description
    $description = $frontmatter['description'].Trim()
    if ($description -match '[<>]') {
        return @{ Valid = $false; Message = 'Description cannot contain angle brackets (< or >)' }
    }
    if ($description.Length -gt 1024) {
        return @{ Valid = $false; Message = "Description is too long ($($description.Length) characters). Maximum is 1024." }
    }

    # Validate compatibility if present
    if ($frontmatter.ContainsKey('compatibility')) {
        $compat = $frontmatter['compatibility'].Trim()
        if ($compat.Length -gt 500) {
            return @{ Valid = $false; Message = "Compatibility is too long ($($compat.Length) characters). Maximum is 500." }
        }
    }

    return @{ Valid = $true; Message = 'Skill is valid!' }
}

function Test-ShouldExclude {
    <#
    .SYNOPSIS
        Determines whether a file should be excluded from the skill package.
        Replicates the should_exclude() logic from package_skill.py.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    $excludeDirs     = @('__pycache__', 'node_modules')
    $excludeFiles    = @('.DS_Store')
    $excludeGlobs    = @('*.pyc')
    $rootExcludeDirs = @('evals')

    # Normalize to forward slashes and split into parts
    $parts = $RelativePath.Replace('\', '/').Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
    $fileName = $parts[-1]

    # Check excluded directories anywhere in path
    foreach ($part in $parts) {
        if ($part -in $excludeDirs) { return $true }
    }

    # Check root-level excluded subdirectories (parts[1] in Python = index 1 here)
    # parts[0] is the skill folder name, parts[1] is the first subdir within the skill
    if ($parts.Count -gt 1 -and $parts[1] -in $rootExcludeDirs) {
        return $true
    }

    # Check excluded filenames
    if ($fileName -in $excludeFiles) { return $true }

    # Check glob patterns
    foreach ($glob in $excludeGlobs) {
        if ($fileName -like $glob) { return $true }
    }

    return $false
}

function New-SkillPackage {
    <#
    .SYNOPSIS
        Validates a skill folder and packages it into a .skill or .zip file.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$SkillPath,

        [Parameter(Mandatory = $false)]
        [string]$OutputDirectory,

        [Parameter(Mandatory = $false)]
        [switch]$AsZip
    )

    Add-Type -AssemblyName System.IO.Compression.FileSystem

    # Resolve and validate skill path
    try {
        $resolvedSkillPath = Resolve-Path -Path $SkillPath -ErrorAction Stop
    } catch {
        Write-CMTraceLog -Message "Skill folder not found: $SkillPath" -Severity Error
        return $null
    }

    $skillFolder = Get-Item -Path $resolvedSkillPath.Path
    if (-not $skillFolder.PSIsContainer) {
        Write-CMTraceLog -Message "Path is not a directory: $SkillPath" -Severity Error
        return $null
    }

    # Confirm SKILL.md exists
    $skillMd = Join-Path -Path $skillFolder.FullName -ChildPath 'SKILL.md'
    if (-not (Test-Path -Path $skillMd)) {
        Write-CMTraceLog -Message "SKILL.md not found in $($skillFolder.FullName)" -Severity Error
        return $null
    }

    # Validate frontmatter
    Write-CMTraceLog -Message 'Validating skill...'
    $validation = Test-SkillFrontmatter -SkillMd (Get-Item $skillMd)

    if (-not $validation.Valid) {
        Write-CMTraceLog -Message "Validation failed: $($validation.Message)" -Severity Error
        return $null
    }

    Write-CMTraceLog -Message $validation.Message

    # Resolve output directory
    if ($OutputDirectory) {
        try {
            $null = New-Item -Path $OutputDirectory -ItemType Directory -Force -ErrorAction Stop
            $resolvedOutput = Resolve-Path -Path $OutputDirectory
        } catch {
            Write-CMTraceLog -Message "Could not create output directory: $_" -Severity Error
            return $null
        }
    } else {
        $resolvedOutput = Get-Location
    }

    $extension    = if ($AsZip) { '.zip' } else { '.skill' }
    $outputFile   = Join-Path -Path $resolvedOutput.Path -ChildPath "$($skillFolder.Name)$extension"
    $parentPath   = $skillFolder.Parent.FullName

    # Remove existing output file
    if (Test-Path -Path $outputFile) {
        try {
            Remove-Item -Path $outputFile -Force -ErrorAction Stop
        } catch {
            Write-CMTraceLog -Message "Could not remove existing file at $outputFile : $_" -Severity Error
            return $null
        }
    }

    # Create the archive
    try {
        $archive = [System.IO.Compression.ZipFile]::Open($outputFile, [System.IO.Compression.ZipArchiveMode]::Create)

        $allFiles = Get-ChildItem -Path $skillFolder.FullName -Recurse -File

        foreach ($file in $allFiles) {
            $relativePath = $file.FullName.Substring($parentPath.Length).TrimStart('\', '/')
            $entryName    = $relativePath.Replace('\', '/')

            if (Test-ShouldExclude -RelativePath $entryName) {
                Write-CMTraceLog -Message "  Skipped: $entryName"
                continue
            }

            try {
                $null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                    $archive,
                    $file.FullName,
                    $entryName,
                    [System.IO.Compression.CompressionLevel]::Optimal
                )
                Write-CMTraceLog -Message "  Added: $entryName"
            } catch {
                Write-CMTraceLog -Message "Failed to add $entryName : $_" -Severity Warning
            }
        }

        $archive.Dispose()

        Write-CMTraceLog -Message "`nSuccessfully packaged skill to: $outputFile"
        return $outputFile

    } catch {
        if ($null -ne $archive) { $archive.Dispose() }
        Write-CMTraceLog -Message "Error creating package: $_" -Severity Error
        return $null
    }
}

#endregion

#region Main

Write-CMTraceLog -Message "Packaging skill: $SkillPath"
if ($OutputDirectory) {
    Write-CMTraceLog -Message "Output directory: $OutputDirectory"
}

$result = New-SkillPackage -SkillPath $SkillPath -OutputDirectory $OutputDirectory -AsZip:$AsZip

if ($result) {
    exit 0
} else {
    exit 1
}

#endregion