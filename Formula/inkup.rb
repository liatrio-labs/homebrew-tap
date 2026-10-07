class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.10.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "17759e20be21fabf9937bba5c02deba2ed208408ad24a7b5c448d4967972bdad"
    sha256 cellar: :any_skip_relocation, big_sur:       "6af2f2e927b0ea87daf31f4b45330a87df29385e39eb2b0805bf61086839e43a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "2b53a59accea6944b0b08f279cc703f56f1d8fbaa94994476746e90ae30409b9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bf95130a47e7727ac80b22839934c9a4bb5edb7cefd0942cbbd6587f094d5ca9"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.10.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "2be9a3fbafa5d709575ae22c0ab2c49c935e0cae2d065d35c378f982055b24ef"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.10.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "12aeb5645744daa26ddd8e7b164d349b00143672df1e5bb19c829debd0ff803c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.10.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bf1261463d5836ecaa3d1ff68a970e201dc7c22d72645abe0d4f23da8580d320"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.10.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9e5de213ee6b3e051025edf6770bd33b34331bbbc9ad5494d889f6871345d347"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
