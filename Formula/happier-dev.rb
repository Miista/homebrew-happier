class HappierDev < Formula
  desc "Mobile and Web client for Claude Code and Codex (dev channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.20-dev.11"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-next",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "56ead3b84b16646f0bcb370c1397b2063452b07965f43889fdd4b7b0795cb27e"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "cbecc9fa65772daa21dbad5563cd9f7ee2f2094d9b1c46c07285cd6150a5aabc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "b84526e3ec571c22ef96c763c2d6ce1e3c9a02fc861cbbce36cf5aa0633fbb4d"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "c5b0faae647278a217c5eec7510f43367e8e5c71abb6c32af1e82101a2d1bbeb"
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
