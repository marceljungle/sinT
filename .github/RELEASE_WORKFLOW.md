# Automated Release Workflow

This document describes the automated release workflow for the sinT Digital Synthesizer project.

## Overview

The automated release workflow builds and packages sinT for multiple platforms when changes from the `develop` branch are merged into the `main` branch.

## Supported Platforms

The workflow automatically builds releases for:

- **Linux x64**: Standalone and kiosk mode (.deb packages)
- **Linux ARM (Raspberry Pi)**: Standalone and kiosk mode (.deb packages)  
- **Windows**: Installer with VST3 plugin (.exe)
- **macOS**: Universal binary for Intel and Apple Silicon (.dmg)

## How to Trigger a Release

1. Create a pull request from `develop` to `main`
2. Include version type in the PR title or description:
   - Include `major` for major version bump (e.g., 1.1.1 → 2.0.0)
   - Include `minor` for minor version bump (e.g., 1.1.1 → 1.2.0)
   - Include `patch` or nothing for patch version bump (e.g., 1.1.1 → 1.1.2)
3. Merge the pull request

## Example PR Titles

```
Merge develop to main - patch
Add new oscillator feature - minor  
Breaking API changes - major
```

## Workflow Process

When a PR from `develop` to `main` is merged:

1. **Version Detection**: Extracts version type from PR title/description
2. **Version Bump**: Automatically increments version in `sinT.jucer`
3. **Multi-Platform Build**: Builds for all supported platforms in parallel
4. **Package Creation**: Creates platform-specific packages
5. **Release Creation**: Creates GitHub release with all packages

## Generated Packages

For version `X.Y.Z`, the following packages are created:

- `sint-digital-synth_X.Y.Z_Linux_x64.deb`
- `sint-digital-synth-kiosk_X.Y.Z_Linux_x64.deb`
- `sint-digital-synth_X.Y.Z_Linux_RPi.deb`
- `sint-digital-synth-kiosk_X.Y.Z_Linux_RPi.deb`
- `sinT_X.Y.Z_win_installer.exe`
- `sinT_X.Y.Z_macOS.dmg`

## Build Dependencies

The workflow automatically installs all required dependencies:

### Linux
- JUCE 7.0.12
- Build tools (gcc, make)
- Audio libraries (ALSA, JACK)
- UI libraries (X11, GTK, WebKit)

### Windows  
- JUCE 7.0.12
- Visual Studio 2022 build tools
- Inno Setup for installer creation

### macOS
- JUCE 7.0.12
- Xcode command line tools
- DMG creation utilities

## Troubleshooting

If the workflow fails:

1. Check the Actions tab in GitHub for detailed logs
2. Ensure the PR is from `develop` to `main`
3. Verify the project builds locally with JUCE 7.0.12
4. Check that all required assets exist in the repository

## Manual Testing

To test the workflow locally:

1. Install JUCE 7.0.12
2. Run Projucer to generate platform-specific build files
3. Build using platform native tools
4. Test the generated binaries

## Security Notes

- The workflow uses `GITHUB_TOKEN` for authentication
- No external secrets are required
- All builds happen in isolated GitHub runners
- Source code is never exposed to external services