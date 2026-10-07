class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.12.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "9fcb09dd695d3ff349353b6c35d52e8f839d0be3e393b4c1933c9e2e0ce3881e"
    sha256 cellar: :any_skip_relocation, big_sur:       "8e034c6fc5aba37e49471475ebeb883e041d3add1fadcc8cfd471588e68007a1"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d1ff49559cea664e724fba7bd795b83023ee22cdcf25482d31888e24006ac562"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "345fed9f00d358209305267b6c3246adfe8ac7dd495b6a2609ba21ff7336adef"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.12.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "e1a724ddfa3a6a5fc04905d99a69102d5fee1bc6b6432d16a7bb8ca6028d7012"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.12.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "9b7581c34fbab398426dbde373ff78a07256b7a1a229b6ffece7b834e1d42902"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.12.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8d8c7b18580b6c418a7276c4f2c4320512d33138200f432f3f2368c7eb7311d1"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.12.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6b6132381177fc41c491f2283a18e1d0291b6ba434365b9b8aba69bef998456f"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
