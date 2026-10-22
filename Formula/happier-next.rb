class HappierNext < Formula
  desc "Mobile and Web client for Claude Code and Codex (next/preview channel)"
  homepage "https://github.com/happier-dev/happier"
  version "0.2.17-preview.1"

  conflicts_with "happier",
    because: "both install the `happier` binary"
  conflicts_with "happier-dev",
    because: "both install the `happier` binary"

  on_macos do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-arm64.tar.gz"
      sha256 "35351b753ee73b316f0b7e41d9c1289be9e7a79409b900cfc0fb89c081d6b618"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-darwin-x64.tar.gz"
      sha256 "3871a570816a7394a4c7d02ba3325260fe9b22d56bd0e6a5c36ca6d9083d0aaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-arm64.tar.gz"
      sha256 "fcc9c771cb11d43a5a864c3b8482948c58d3ef53728b0aba20fe1b9fa7fa74d9"
    end
    on_intel do
      url "https://github.com/happier-dev/happier/releases/download/cli-v#{version}/happier-v#{version}-linux-x64.tar.gz"
      sha256 "cad352cb8b4da5a892e50d6775ff1aa2d3e373585d12d464b2949a8992f3f248"
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
