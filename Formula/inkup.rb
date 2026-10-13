class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.14.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "6546987b673ac46ef811c85a76ac5f348d7779948d0956d33313e1db90884959"
    sha256 cellar: :any_skip_relocation, big_sur:       "6517cce1b6a383ca3c7228ae294f5e9a48137a435b764bff50f65d8487d7fcef"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "44d2b4be8f485ff2fb6874cf7853c769cf1a475e5d703f5949c75989c1ad20cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b14042021963d8574c4b358082b2f95c84617656840f93102ec69373d6af8a00"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "e29f8c5fc553aea613e22352ca2e635104d41f116397dfba1a4f93f9e6cfdafc"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "7a2dbfda2c84e13850ef0f824d565582b108f8d1eebb8a78f2245c2c6a15397c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b2291bfa8e003375646e4ffb7a8355469c5f175efe44e3e13471ba64aa8cb879"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.14.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8a5d010b2ea1f3b9a2204b5481d3293f27fda927426c35941c3c55d8d71b3473"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
