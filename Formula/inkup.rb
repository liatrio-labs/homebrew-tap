class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.8.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "9c563b52224ebca7b2e0662197181a99eea1538682484830cdf1abac1b589b0a"
    sha256 cellar: :any_skip_relocation, big_sur:       "0a6d5bd7ae345c816363b30596a80ca86514709add764d886df78fd92a85b5e9"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "67ecd7ac3c52a53c06483e7d842962ea3b7ffded694d09bd9fd43ed194cfe7c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6a2314a9be36c89e9f810b617982c084da5d9c2d9503f47aca00334b50e1ad7c"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.8.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "74ebe8b758efc35b97d4d1692bfe3e19ba70a98b4e24c0c45c8b28e06cf78e46"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.8.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "acd40d39206eefaac5171b75b85488088002d72bbc88038677168d0a7bed1758"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.8.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4d982c5c61aeb23943a8cd9464e86eb5f9bc8f42b65fe7909f1c35c27e30bc06"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.8.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b169ceb77dd9b727a48d7d51ca9ee61f54bbf97a4bf6fba9beadd2a29fcfada7"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
