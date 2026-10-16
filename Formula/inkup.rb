class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.14.1"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.1"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "0f04ee7251c632c00a74a58555da8224dad1a7e1b5cfd8d137a28a45eda81e7e"
    sha256 cellar: :any_skip_relocation, big_sur:       "0a8cd294c945aba2a4de51c96656f865969c421883f77fc013647a8d6c3de6d4"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "038e99a46d9b3232431df7b567a38b981a3951fd6e9697c9956d605234257b46"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2f5897b502e32360b78a213dcd62ed1d2850cd004e401f866964170aa2122bb6"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.1/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "71212264a72a6c3f3bf6bb5e50dc838c91bfc8e73765a81a3e3a7650de32ee47"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.1/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "4f80a1d5fc78f58c2ef1069c34798345977d5a7734abd56f3ca7c712089febc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.1/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "147e1a8adaefc6b0c5594650cc5c896f3f05d41446000b4e47b507f1fdd761be"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.1/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ed53429f14ff1e6f72fa8130acaa47ea4abcaf7ee0c950035bd90c7c874527bb"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
