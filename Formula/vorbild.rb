class Vorbild < Formula
  desc "Generate files from templates"
  homepage "https://github.com/TrueWarg/vorbild"
  url "https://github.com/TrueWarg/vorbild/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e7fc7ce3d5e5beb6ce42ab2210c2913de777072d3a1409d27608c688b70b6d45"
  license "Apache-2.0"

  depends_on "ghc" => :build
  depends_on "haskell-stack" => :build
  
  uses_from_macos "xz"

  def install
    ghc_args = [
      "--system-ghc",
      "--no-install-ghc",
      "--skip-ghc-check",
    ]

    system "stack", "build", *ghc_args
    system "stack", "--local-bin-path=#{bin}", "install", *ghc_args
  end
end