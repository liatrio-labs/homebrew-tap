class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.15.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.15.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "d42cea572d5d14d5bbc61c54d938d3becdfc56c2ad18f5c539877252a810a31f"
    sha256 cellar: :any_skip_relocation, big_sur:       "cc2fe7f0be5dc537bd60b3f3d4efe70584b6725557a820de0c00019c0b3d4754"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c02163b07c77210ab0b2f572ecd078d99fc786fe2f21d56ed655c0927f435c14"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5414a57d0a950bd39e22b3a427f4c407e9a5d4405aac5e3809ed57d721b1d241"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.15.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "b6a51e27ee42a733ba1287a107bf02b1d29d060ef7e9bc0f3fa7f5aeccb04d97"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.15.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "30233f8dad30ac468faef7d23c83c2f44b91d08376e48c34dac57165e2737f95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.15.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "17384eb5343acf8f2a41cabf20e854dbe4f240adcbdbc00710aca1c55016f372"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.15.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7063adda9539651294a957989d5cefd6e59cbeb2a5a5cf85ffa10c29ae14cfdd"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
