class HappierDev < Formula
  desc "Mobile and Web client for Claude Code and Codex (dev channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20-dev.6"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-next",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "fe19d7ae1f5dd41fef0cb06fadb4c558bd0e6ad047ed36af77806a73b1ed9281"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "59aa6acf8b34208288ec19f6b33b810457d65cc4ea0eaff6dc2070780c7c94d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "54416b6531d737022a422a1f3f542afbd929f0a61beede0648098276bc10ce1b"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "3c5a6b7bb5e881c30b2da03957680428be1ce2b2077f2d5a30297dba642b48cc"
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
