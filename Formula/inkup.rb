class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.18.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.18.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "2757bd0c4ed92d8e9aaec749f92e42f67cdf9ab96dd5d872605946491db73d71"
    sha256 cellar: :any_skip_relocation, big_sur:       "bffe0be3bba29dfa258abbaca77f88ba64968db358bc4a8d8453eda5b9cde571"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "07effa043114f9eebfb82e7d3645edd827268123a0ef75e9b8df56685e0a7f05"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "61e7d07450a9dca0c91e2985d09bd90b8be906142883748652d8610b8dd2572c"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.18.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "6712a2e9b39a817cf1612c27771754a6f03a10014f084bb9032bdcf734ff6925"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.18.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "d2c5f43bc99487c5b0a1b5e6958530bc5ae953815951bfbc06ec7be2090e46f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.18.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "60401177416c02a35bebf96120c4df6f255977bb1532c8c20123002a97b710cc"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.18.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1b7baeddf9e84f5615017e7125cbc6845ea55432c2dd07cc3d8fa384042c9fb9"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
