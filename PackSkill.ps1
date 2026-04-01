param(
    [string]$SkillDir,
    [string]$Root = (Get-Location).Path,
    [switch]$All,
    [switch]$WhatIf,
    [switch]$SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-RelativePath {
    param(
        [string]$BasePath,
        [string]$TargetPath
    )

    $base = (Resolve-Path -LiteralPath $BasePath).Path
    $target = (Resolve-Path -LiteralPath $TargetPath).Path

    if ($target.StartsWith($base, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $target.Substring($base.Length).TrimStart([char]'\', [char]'/')
    }

    return Split-Path -Path $target -Leaf
}

function Get-ReferencedLocalFiles {
    param(
        [string]$SkillMarkdownPath,
        [string]$SkillFolder
    )

    $content = Get-Content -LiteralPath $SkillMarkdownPath -Raw
    $results = New-Object System.Collections.Generic.List[string]

    $patterns = @(
        '!\[.*?\]\((.*?)\)',
        '\[.*?\]\((.*?)\)',
        'src=[''\"]([^''\"\)]+)[''\"]',
        'href=[''\"]([^''\"\)]+)[''\"]'
    )

    foreach ($pattern in $patterns) {
        $regexHits = [regex]::Matches($content, $pattern)
        foreach ($match in $regexHits) {
            $ref = $match.Groups[1].Value.Trim()
            if ([string]::IsNullOrWhiteSpace($ref)) { continue }
            if ($ref -match '^https?://') { continue }
            if ($ref.StartsWith('#')) { continue }

            $fullPath = Join-Path $SkillFolder $ref
            if (Test-Path -LiteralPath $fullPath) {
                $resolved = (Resolve-Path -LiteralPath $fullPath).Path
                if (-not $results.Contains($resolved)) {
                    [void]$results.Add($resolved)
                }
            }
        }
    }

    return $results
}

function Invoke-SelfTest {
    param(
        [string]$RepoRoot
    )

    $skillFolder = Join-Path $RepoRoot 'PiHole'
    $skillFile = Join-Path $skillFolder 'skill.md'
    $rootScript = Join-Path $RepoRoot 'PackSkill.ps1'

    if (-not (Test-Path -LiteralPath $skillFile)) {
        throw "Self test failed because test input file was not found: $skillFile"
    }

    if (-not (Test-Path -LiteralPath $rootScript)) {
        throw "Self test failed because root script was not found: $rootScript"
    }

    $inside = Get-RelativePath -BasePath $skillFolder -TargetPath $skillFile
    if ($inside -ne 'skill.md') {
        throw "Self test failed for in-folder relative path. Expected skill.md but got: $inside"
    }

    $outside = Get-RelativePath -BasePath $skillFolder -TargetPath $rootScript
    if ($outside -ne 'PackSkill.ps1') {
        throw "Self test failed for out-of-folder fallback. Expected PackSkill.ps1 but got: $outside"
    }

    Write-Host 'Self test passed.'
}

function Compress-SkillFolder {
    param(
        [string]$FolderPath,
        [switch]$PreviewOnly
    )

    $skillMdPath = Join-Path $FolderPath 'skill.md'
    if (-not (Test-Path -LiteralPath $skillMdPath)) {
        Write-Warning "Skipping $FolderPath because skill.md is missing."
        return
    }

    $outputPath = Join-Path $FolderPath 'skill.zip'
    $filesToZip = New-Object System.Collections.Generic.List[string]
    [void]$filesToZip.Add((Resolve-Path -LiteralPath $skillMdPath).Path)

    $referenced = Get-ReferencedLocalFiles -SkillMarkdownPath $skillMdPath -SkillFolder $FolderPath
    foreach ($item in $referenced) {
        if (-not $filesToZip.Contains($item)) {
            [void]$filesToZip.Add($item)
        }
    }

    if ($PreviewOnly) {
        Write-Host "Would package $FolderPath -> $outputPath"
        return
    }

    # Ensure stale archive is removed before creating a new one.
    if (Test-Path -LiteralPath $outputPath) {
        Remove-Item -LiteralPath $outputPath -Force
        Write-Host "Removed existing archive at $outputPath"
    }

    $folderFull = (Resolve-Path -LiteralPath $FolderPath).Path
    $staging = Join-Path $env:TEMP ("skillpack-" + [guid]::NewGuid().ToString())
    New-Item -ItemType Directory -Path $staging | Out-Null

    foreach ($file in $filesToZip) {
        $entryName = Get-RelativePath -BasePath $folderFull -TargetPath $file
        $dest = Join-Path $staging $entryName
        $destDir = Split-Path -Path $dest -Parent
        if (-not (Test-Path -LiteralPath $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }
        Copy-Item -LiteralPath $file -Destination $dest -Force
    }

    Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $outputPath -Force
    Remove-Item -LiteralPath $staging -Recurse -Force

    Write-Host "Packaged skill to $outputPath"
}

$rootPath = (Resolve-Path -LiteralPath $Root).Path

if ($SelfTest) {
    Invoke-SelfTest -RepoRoot $rootPath
    exit 0
}

# Default behavior is to package all skills unless a specific folder is supplied.
if (-not $All -and -not $SkillDir) {
    $All = $true
}

if ($All) {
    $folders = Get-ChildItem -LiteralPath $rootPath -Directory | Where-Object {
        Test-Path -LiteralPath (Join-Path $_.FullName 'skill.md')
    }

    if ($folders.Count -eq 0) {
        Write-Warning "No skill folders found under $rootPath"
        exit 0
    }

    foreach ($folder in $folders) {
        Compress-SkillFolder -FolderPath $folder.FullName -PreviewOnly:$WhatIf
    }

    exit 0
}

if (-not $SkillDir) {
    $SkillDir = $PWD.Path
}

$resolvedSkillDir = (Resolve-Path -LiteralPath $SkillDir).Path
Compress-SkillFolder -FolderPath $resolvedSkillDir -PreviewOnly:$WhatIf
