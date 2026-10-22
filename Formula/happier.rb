class Happier < Formula
  desc "Mobile and Web client for Claude Code and Codex"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.17"

  conflicts_with "happier-next",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "13e12436161dcb73fc927a87de02d565d02f5be69bed540cf6f707ebee0ae1c1"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "7c5bb422579a8521f01eb8b6b24f13d7af6103d331027678bc739e3a797e0c0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "80e3110dc55a2a22f0cca6d26903715b67581eb5509be4e4a403b5898214bb44"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "969328ed5296119d18e3ca48839e0baafb5d05d1ed7047afacfbac064fd8cbc4"
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
