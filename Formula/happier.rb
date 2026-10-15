class Happier < Formula
  desc "Mobile and Web client for Claude Code and Codex"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.16"

  conflicts_with "happier-next",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "56c693a3fe4dc747534595814b33ce32b0aac0b01ca5f18adaca503c09e661ce"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "76e9a41834741758b0e870d281f1546eb268fe35b6c5946e2bafc6993bd1828a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "37dad9cde5545d82b843a49b7229949213221c4e976e8c58a35fb34d76e9b20b"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "50018f306c8e985ea1bd05128d73f128a29f229eb8a7b32a7bb4294ce6ca7a32"
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
