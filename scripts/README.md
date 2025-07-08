# Scripts

This directory contains utility scripts for the sinT project.

## bump-version.sh

A local version bumping script for testing version changes before creating release PRs.

### Usage

```bash
# Bump patch version (1.1.1 → 1.1.2)
./scripts/bump-version.sh patch

# Bump minor version (1.1.1 → 1.2.0)
./scripts/bump-version.sh minor

# Bump major version (1.1.1 → 2.0.0)
./scripts/bump-version.sh major

# Default is patch if no argument provided
./scripts/bump-version.sh
```

### What it does

1. Reads current version from `sinT.jucer`
2. Calculates new version based on type
3. Asks for confirmation
4. Updates the version in the project file
5. Provides next steps for creating a release

This script helps test version changes locally before creating PRs that trigger the automated release workflow.