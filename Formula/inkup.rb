class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.9.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "e96c85e91eb9e092ad98e4445ca209d6271da18bdd144f15ad94b90fe4cd1328"
    sha256 cellar: :any_skip_relocation, big_sur:       "f9c96822677c672f141986d668f9b3a4cd350df3b62d5df933d9e11d097d5070"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "3d3ab9d258857dc22b11244e79b825cff763d4a9fe1d6f6486fbdc61e64ebdd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3ea6bcb58112b43cd3748cbeec9b9d021923f2163b667fe169f2817f29c07a0d"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.9.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "f3fe48b4f4f44757a22162b6b2f751a47b2ea995671a0b62b462af93740114b7"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.9.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "7e9a0f81ea3e642c44808651627fa998296b0717723d02e28a6fbaf8692f058c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.9.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d9ab0f3809c4de1a9c094eacc94f03dc8782118bbb42fb723db115f73d5f69d8"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.9.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4eb30f64ded825776f81d9adcefe9da63e2bb769cd4945b25e37762b161414a5"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
