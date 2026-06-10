class Rude < Formula
  desc "Terminal RU-DE Translator with AI Voice (Edge TTS / macOS say)"
  homepage "https://github.com/chumafox/ru-de-translator"
  url "https://github.com/chumafox/ru-de-translator.git", branch: "dev"
  version "1.0.0"

  depends_on "ffmpeg"

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
      RU-DE Translator uses 'uv' for lightning-fast python management.
      The installer will attempt to set it up automatically on first run.
    EOS
  end
end
