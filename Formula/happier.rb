class Happier < Formula
  desc "Mobile and Web client for Claude Code and Codex"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20"

  conflicts_with "happier-next",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "755b109cbf992632d28b3939478b58ae949a9766c4bb90ed9f6d8b7545c3efee"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "8c6bc4c8eea785c3588a659ab2cc8b4ec83c47df4a9407b39b8ad57c7c5f9dcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "b0f8afe3b6941f0e11a240b59fc15721da726ac16aad8f122c9a64515982f188"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "cac890b90e53309afd5178332017b195071cf1e3dd373ac5d8524c2bb2c74b60"
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
