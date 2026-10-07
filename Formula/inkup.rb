class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.13.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "552129b91ae4e3328e17433413390746bcda28f062a3ea4d2db87140c37e62ba"
    sha256 cellar: :any_skip_relocation, big_sur:       "2a6d4a7201aea344199fdd26e43f7e7f174837af1dbcd35e9013a9fc8ca562d1"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "f0805f62584bf5d185e7cacad9e28349828866e12c3ef1ca95d96337e03602f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1db90afd3b3b233e41698f888b738d42292a5a727c00ec0f511d526138faa1a3"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "42f56b0f7e4d1094669a8fb126854b409a76f37d77058f94f6a740dca2ddcfe9"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "dbd0d4323950bac2322c1e0ddaf314a92c0a89e033a1b7cd5fc0d53c7ff8ad68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d7e9dbd61d41dc169807f2fa01754b2093d603667f9c7da1e0eb2c5154aece1b"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.13.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b8aa3533550f0a32290884786ea03a0fa4577d700cb5d67a6a533505e173ef23"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
