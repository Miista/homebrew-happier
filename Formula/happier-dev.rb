class HappierDev < Formula
  desc "Mobile and Web client for Claude Code and Codex (dev channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20-dev.2"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-next",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "4c57e4e17eee46ec3b0ec18580a4715ea948bc853d609bbd43c02f208bdee187"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "57085607de24459653d2c87a6e92bb3af4e4db6f85d644d06a2563311c9e6084"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "5575cd2b40da44afed531aa73faaac68bd8addf919b06e5cc3026f97ae97d0c1"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "7d4a78bec59c2637a305d726b2515883a7e570ad80e8822a330ce986afdfa0ee"
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
