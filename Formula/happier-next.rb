class HappierNext < Formula
  desc "Mobile and Web client for Claude Code and Codex (next/preview channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20-preview.2"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "620e80a790881331878ff4c345ee3bf84961428bfd19c88a0486d62f3c44b57a"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "b3a3a09dee1d8f4b3098987caedca1716df519bfd01bccea9fcb74eef2a5aebb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "161e4d46cfc080184c35cd60a6464b124dbad7c36a6ff56d084f3f1049062b98"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "13774ce04524e3cffef0708ba14df673a56f9de8d2861fba5cd6676ce5baa16e"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"happier"
    system "xattr", "-drs", "com.apple.quarantine", prefix if OS.mac?
  end

  test do
    system bin/"happier", "--version"
  end
end
