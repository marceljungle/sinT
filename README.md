# sinT

<p align="center">
   <img src="Source/GUI/Assets/sinT_logo.png" width="300" height="300">
</p>

sinT is a digital, polyphonic, multi-platform synthesizer. Compatible with GNU/Linux, Windows and Mac, it can be run as an independent program (standard standalone and kiosk mode) and in VST3 plugin format on x64 and ARM systems.

## Technical specifications
 - 16-voice polyphony (expandable via source code according to host system characteristics).
 - Intuitive user interface design aimed at facilitating integration of sinT into systems with diverse features, such as small-sized touchscreens.
 - Oscillators:
    - Two independent oscillators with bypass control.
    - Four different waveforms:
        - Sine.
        - Sawtooth.
        - Square.
        - Triangle.
    - Gain and pitch controls.
    - One FM operator per oscillator -> FM synthesis.
 - ADSR envelopes to control waveform amplitude and filter frequency action.
 - State variable filter with three different modes:
    - Low-pass.
    - Band-pass.
    - High-pass.
 - Low-frequency oscillator (LFO) to modulate filter cutoff frequency.
 - FX processor:
    - Soft Clipping Distortion.
    - Delay.
    - Chorus.
    - Reverb.
 - Dual-channel output waveform visualizer.
 - Ability to save and load user and factory presets.

## Automated Releases

sinT features automated release builds for multiple platforms. When changes from the `develop` branch are merged into `main`, the system automatically:

- Builds for Linux (x64 and ARM/Raspberry Pi), Windows, and macOS
- Creates platform-specific packages (.deb, .exe, .dmg)
- Generates GitHub releases with all binaries

For more information, see [Release Workflow Documentation](.github/RELEASE_WORKFLOW.md).

## Development

### Version Management

Use the included script to test version bumps locally:

```bash
./scripts/bump-version.sh [major|minor|patch]
```

### Building from Source

sinT is built using JUCE 7.0.12. The automated release workflow handles all platform builds, but for local development:

1. Install JUCE 7.0.12
2. Open `sinT.jucer` in Projucer
3. Generate platform-specific build files
4. Build using your platform's native tools
