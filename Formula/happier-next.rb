class HappierNext < Formula
  desc "Mobile and Web client for Claude Code and Codex (next/preview channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20-preview.1"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "9aab249d1b6cbda225885043399de9bfc229a08b1d7e431a6b13f1174f0a1b8a"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "f88b6d50e074f468e55fe45b3c7a6c7435883995e8f3a23deb2c2b922b111c83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "f2fd6d25594457c0796ed73ded4c25664d091e9af8717b43d934ae32a28ecec7"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "bbfa910473e16d19c91c5f68fabbd1f64c80b3021af6c538cdabbecd71cc67ae"
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
