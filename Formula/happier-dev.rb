class HappierDev < Formula
  desc "Mobile and Web client for Claude Code and Codex (dev channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.17-dev.2"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-next",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "0df5e9a6610b5c97a073680fbaf43798049635fc3a08d6c27aadade8cf379706"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "8ac0446c95aa4efd42d7230a9df88265b7e56d72b7913667a3d334a2b2da4582"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "85afb6f02201bb4293254a3f1aaf6bd57f1ad14014040c75df90126d45b76760"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "c533ace72b725cb4ae748d931f6dc7eb1a1f5f0710624acf18a944137b3283c5"
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
