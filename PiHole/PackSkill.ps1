param(
     [string]$SkillDir = (Get-Location),
     [string]$OutputPath = (Join-Path $SkillDir "skill.zip")
)

$skillMdPath = Join-Path $SkillDir "skill.md"

if (-not (Test-Path $skillMdPath)) {
     Write-Error "skill.md not found in $SkillDir"
     exit 1
}

$filesToZip = @($skillMdPath)

$skillContent = Get-Content $skillMdPath -Raw

$patterns = @(
     '!\[.*?\]\((.*?)\)',
     '\[.*?\]\((.*?)\)',
     'src=[''"]([^''""]+)[''"]',
     'href=[''"]([^''""]+)[''"]'
)

foreach ($pattern in $patterns) {
     $matches = [regex]::Matches($skillContent, $pattern)
     foreach ($match in $matches) {
          $filePath = $match.Groups[1].Value
          
          if ($filePath -match '^https?://' -or $filePath -match '^\#') {
               continue
          }
          
          $fullPath = Join-Path $SkillDir $filePath
          
          if (Test-Path $fullPath) {
               $filesToZip += $fullPath
          }
     }
}

$filesToZip = $filesToZip | Select-Object -Unique

if (Test-Path $OutputPath) {
     Remove-Item $OutputPath -Force
}

# Create a temp staging directory and copy files preserving relative paths
$skillDirFull = (Resolve-Path $SkillDir).ProviderPath
$staging = Join-Path $env:TEMP ("skillpack-" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $staging | Out-Null

foreach ($file in $filesToZip) {
     $fileFull = (Resolve-Path $file).ProviderPath

     if ($fileFull.StartsWith($skillDirFull, [System.StringComparison]::OrdinalIgnoreCase)) {
          $entryName = $fileFull.Substring($skillDirFull.Length).TrimStart('\','/')
     }
     else {
          $entryName = Split-Path $fileFull -Leaf
     }

     $dest = Join-Path $staging $entryName
     $destDir = Split-Path $dest -Parent
     if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
     Copy-Item -LiteralPath $fileFull -Destination $dest -Force
}

# Use Compress-Archive which is available in PowerShell 5 and later. This is more compatible
Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $OutputPath -Force

# Clean up staging directory
Remove-Item $staging -Recurse -Force

Write-Host "Packaged skill to $OutputPath"
