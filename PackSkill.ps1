param(
    [string]$SkillDir,
    [string]$Root = (Get-Location).Path,
    [switch]$All,
    [switch]$WhatIf
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
        return $target.Substring($base.Length).TrimStart('\\', '/')
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
        $matches = [regex]::Matches($content, $pattern)
        foreach ($match in $matches) {
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

function Pack-SkillFolder {
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

    if (Test-Path -LiteralPath $outputPath) {
        Remove-Item -LiteralPath $outputPath -Force
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
        Pack-SkillFolder -FolderPath $folder.FullName -PreviewOnly:$WhatIf
    }

    exit 0
}

if (-not $SkillDir) {
    $SkillDir = $PWD.Path
}

$resolvedSkillDir = (Resolve-Path -LiteralPath $SkillDir).Path
Pack-SkillFolder -FolderPath $resolvedSkillDir -PreviewOnly:$WhatIf
