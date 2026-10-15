class HappierNext < Formula
  desc "Mobile and Web client for Claude Code and Codex (next/preview channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.16-preview.1"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "34ba6fca19fbc94ee556ff0932b4061391a0b89f8380b9424f657c75bc11b319"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "72cc7b285472d04fd52424daf0f56aa10c05452ec84024abc8dec98abad786bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "768bccd55bc7cbfce36ee1a202c8ec5fc43df3e0443727583865f13301dfdf41"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "3c291875edebc0ee6983eb34531b2ae00feba6de04352bc566a87b52c75189ac"
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
