class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.13.1"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.1"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "3652c85e76c194b263b5ad79d48734852ac199c631c9a962211161a2ec19d21b"
    sha256 cellar: :any_skip_relocation, big_sur:       "3a9d2bc7faf0da3a0f1df168c5fc5839e937ec602a74c4e1d1a4ee82125ecc32"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "bd6de081d23c7e0b46f0bd508901eff8be1726e92a413a7e8296a74ba14e9da6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "777da4ee3fd1df1b45f29574f1c79de2ebd9a19b3c95446006fd5cacabb9e0f7"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.1/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "4a27f7acc22600701dfda1af80adcb461dd7a843277c0353e8387fbd8de52683"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.1/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "06a6d7d37e931b2a44088f4d3c4b6bda5218e926f46f8e03acb4886f9cc1d130"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.1/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b39405e7f2e0c0ba2948b9944ed4607367f4af250201d5b357e5f2480095d611"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.1/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "afb24b251c15d67fffe6005520bf902ffaf3b7ce38a9e1386349bb38867cdc0a"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
