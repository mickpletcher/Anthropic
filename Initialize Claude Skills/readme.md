# Initialize-ClaudeSkills.ps1

PowerShell script for managing Claude skill installations on Windows. Installs, updates, removes, and lists skills in the Claude Desktop skills library.

## Requirements

- Windows PowerShell 5.1 or PowerShell 7+
- Claude Desktop installed
- Skills directory at `$env:USERPROFILE\OneDrive\Documents\Claude\Skills\` (created automatically on first run)

## Usage

```powershell
powershell.exe -ExecutionPolicy Bypass -File Initialize-ClaudeSkills.ps1 [parameters]
```

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-SkillsRoot` | String | Override the default Skills library path |
| `-SourcePath` | String | Override the default source path (defaults to Downloads) |
| `-RepoPath` | String | Path to a cloned copy of the repo — installs from `\skills\` subfolder |
| `-SkillName` | String | Target a single skill by name (without `.skill` extension) |
| `-Remove` | Switch | Remove a skill. Requires `-SkillName` |
| `-UpdateOnly` | Switch | Only reinstall skills already present. Skips new skills |
| `-List` | Switch | Display all installed skills and exit |
| `-WhatIf` | Switch | Dry run — shows what would happen without making changes |

## Examples

### Install all skills from Downloads
```powershell
.\Initialize-ClaudeSkills.ps1
```

### Install a single skill
```powershell
.\Initialize-ClaudeSkills.ps1 -SkillName "powershell-automation"
```

### Install directly from a cloned repo
```powershell
.\Initialize-ClaudeSkills.ps1 -RepoPath "C:\Repos\Anthropic"
```

### Update all already-installed skills (skip new ones)
```powershell
.\Initialize-ClaudeSkills.ps1 -UpdateOnly
```

### Remove a skill
```powershell
.\Initialize-ClaudeSkills.ps1 -Remove -SkillName "blog-post"
```

### See what is currently installed
```powershell
.\Initialize-ClaudeSkills.ps1 -List
```

### Dry run — preview changes without applying them
```powershell
.\Initialize-ClaudeSkills.ps1 -WhatIf
```

## Source Path Resolution

The script resolves the skill source in this order:

1. `-RepoPath\skills\` if `-RepoPath` is specified and the folder exists
2. `-SourcePath` if explicitly provided
3. `$env:USERPROFILE\Downloads` by default

If `-RepoPath` is given but the `\skills\` subfolder is not found, the script falls back to Downloads with a warning.

## Output

New installs are tagged `[NEW]` in green. Updates to existing skills are tagged `[UPDATED]` in cyan. Skipped or failed items are logged in yellow or red. A full list of installed skills is printed at the end of every run.

## Directory Structure Created

```
$env:USERPROFILE\OneDrive\Documents\Claude\Skills\
├── user\       ← installed skills live here
└── public\     ← reserved for public/shared skills
```

Each `.skill` file is a zip archive extracted into its own subdirectory under `user\`.

## After Running

Restart Claude Desktop to load any newly installed or updated skills.
