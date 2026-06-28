class Rude < Formula
  desc "Terminal RU-DE Translator with AI Voice (Edge TTS / macOS say)"
  homepage "https://github.com/chumafox/ru-de-translator"
  url "https://github.com/chumafox/ru-de-translator/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0715cebe6cb53c97968b0f0f4638dc57c9bcf9934128815a9ac9ec26215d5fa1"

  depends_on "ffmpeg"
  depends_on :macos

  def install
    # Install all files to Homebrew's libexec directory
    libexec.install Dir["*"]

    # Create the executable wrapper in Homebrew's bin directory
    (bin/"rude").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"

      # Run setup if the virtual environment is not initialized
      if [ ! -d ".venv" ]; then
        echo "First run detected! Setting up RU-DE Translator environment..."
        ./install.sh
      fi

      # Run the application
      ./rude "$@"
    EOS
  end

  def caveats
    <<~EOS
      RU-DE Translator uses 'uv' for lightning-fast Python management.
      The installer will attempt to set it up automatically on first run.

      System requirements:
        - macOS with at least 8 GB RAM
        - At least 2 GB free disk space (for neural models)

      On first run, the app will automatically download:
        - The 'uv' Python package manager
        - The Helsinki-NLP/opus-mt-tc-big-zle-de translation model (~1.5 GB)

      Note: If you are in China (PRC), the model download requires a VPN/proxy
      as HuggingFace is blocked. Set up your proxy before the first run.
    EOS
  end

  test do
    assert_path_exists bin/"rude"
    assert_path_exists libexec/"install.sh"
  end
end
