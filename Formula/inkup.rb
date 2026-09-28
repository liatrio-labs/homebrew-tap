class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.6.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "ab94d53eba8cb71a74459552e724f7146895fa80768e5ff78f5fb2351884cd0d"
    sha256 cellar: :any_skip_relocation, big_sur:       "ea18fc831833fcc6b942f52258f75f17f1b79bbfe30c928a2be968a0cdc98ed8"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "08364ba8f85d3ba633bf52842b7050c6a07cd869a816c0a6ef74753d538272e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "be9dce889b32b6755111d7498ebc31fd4bb716b668561f57e7caed0d1e969559"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.6.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "f408eca173146486a918580d69d03f454e4ca8a9aa71502aeec9d6204ed97626"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.6.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "68c66cac933e21573068ed6e84ca6b14d4fe94561443ba3d98465114db8c05da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.6.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f0c7a3d5ef76f6d8bc4e3df47d60d042a27eb832fc75f18748e0f3e4203c1a2c"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.6.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "aa1a7ffb5ee5eaa9ccea6988ce4a1b9d18c5323232a4e6ece2670ac89f12ad09"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
