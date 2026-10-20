class HappierDev < Formula
  desc "Mobile and Web client for Claude Code and Codex (dev channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.16-dev.7"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-next",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "6050ba4210f8ac40f703c04a8d2bf5661da92ffb1f8df9a7ef313cb25504046e"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "1be202746abc345b7a27b73127fd999b587cb7e71411e30df1a11edad12125a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "e9e895818372195422e4254f6cd5fcff0011ba6a33ffe687fad881a83e34d5ea"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "547884170d8fa1f5c2f6f09f1ddcccdabd414472c06fec06cdb3aa594935d7f7"
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
