# Homebrew Tap for RU-DE Translator

This is the official Homebrew tap for [ru-de-translator](https://github.com/chumafox/ru-de-translator).

## System Requirements

- macOS (Apple Silicon or Intel)
- At least **8 GB RAM** (required for neural translation models)
- At least **2 GB free disk space** (for model downloads on first run)

## Installation

To install `rude` on your macOS machine, run the following commands in your terminal:

```bash
brew tap chumafox/rude
brew install rude
```

Or, in a single command:

```bash
brew install chumafox/rude/rude
```

## Running the App

Once installed, you can launch the translator from anywhere by simply typing:

```bash
rude
```

## First Run

On the very first run, `rude` will automatically:

1. Install the `uv` Python package manager
2. Create an isolated Python virtual environment
3. Download the offline neural translation model (~1.5 GB from HuggingFace)

This process takes a few minutes. Subsequent launches are instant.

> **Note for users in China (PRC):** HuggingFace is blocked without a VPN/proxy.
> Make sure your proxy is active before the first run.

## Troubleshooting

**FFmpeg not found:**
```bash
brew install ffmpeg
```

**`uv` installation failed:**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Model download failed (China/network issue):**
Set up your proxy and re-run `rude`. The installer will retry automatically.

## Uninstall

```bash
brew uninstall rude
brew untap chumafox/rude
```
