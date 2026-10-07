class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.11.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "5ef0f911522d28ba46d31560751380300bcab8d6bde58d97d1ad9b0a1c8991b8"
    sha256 cellar: :any_skip_relocation, big_sur:       "7bb3cdb0190265dc9e1b509a82c880972be072d28e61f3aa7d782e530caef711"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "25d5d9e5f8623c875bd2a24a286b66c5226bbdb78d6c8d59886b4a18662e91b0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6fe1255bf81b4748829907089a50a3f962706e86a042558dbd5c1f9cc07e839a"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.11.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "8663d37065981de40337d911b772a6d4edd29727f105c0e6c5fe6587641edb02"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.11.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "1f554ab894525b5cf4e8214f6b487678fef8c362614d412618dab299205f7eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.11.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "922db2431507c784b51097f77cd74d76a3a758353f3a2d499b9acff221b3926f"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.11.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "04f047f9b4f33ac9c528146fdf7eb656369b207af2a7292d045fbd9f9f4870d5"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
