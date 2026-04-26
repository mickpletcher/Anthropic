# Roadmap Alignment: GitHub Repo Architect

## Proposed Enhancements

Roadmap goal: "Converts idea into full repository structure. Generates README, folder layout, prompts, and CI pipeline."

Current scope: Generates README.md files only.

### Phase 1: Full Repo Scaffolding

- Accept a repo idea, purpose, or existing GitHub URL
- Generate complete folder structure:
  - `src/` organized by module or component
  - `tests/` matching test structure to code
  - `docs/` with architecture and API docs
  - `examples/` or `samples/` with usage patterns
  - Config files (`.gitignore`, `.eslintrc`, `pyproject.toml`, etc.)
- Output as a file tree with placeholder content

### Phase 2: Prompt and Agent Scaffolding

- Generate `.instructions.md` or similar Claude customization files for the repo
- Create skill or agent definitions if the repo is skill-focused
- Produce YAML frontmatter templates for repo type

### Phase 3: CI/CD Pipeline Generation

- Generate workflow files (GitHub Actions, GitLab CI, etc.)
- Include testing, linting, and build stages
- Add security scanning and dependency checks
- Produce deploy configurations if applicable

### Phase 4: Documentation Generation

- Generate architecture documentation
- Create API reference stubs
- Produce CONTRIBUTING.md and CODE_OF_CONDUCT.md
- Output LICENSE template (MIT default)

## Related Skill

See also: GitHub Readme (README generation only).
