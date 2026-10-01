class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.7.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "d8eca24c81eac2fa1145bacdf7145c103ead6058c57e12077c8b22a4f44e1cbe"
    sha256 cellar: :any_skip_relocation, big_sur:       "7a176dfe871428952d6b702db8d1895bc24f0f610ea35f7f927d7bbbac2812f8"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0da728911567cc0a6e9bba0ccef484c75c211535c8b67fe112257ae1d264c69e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ad6e622b266676823e7cc68e2e8d67e655d2739a3517919401ecddefdf8cd1c0"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.7.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "6f9ed4378d1bd29e0346da1ce2b592e50bf4ea1678bf280520f7fec9cb5e2446"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.7.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "6f83e46ef6bf97d04cc56a79faf7ec347e032cdc651e8df598b3c43c9aec2a9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.7.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1fb71deaa0239726405703fde2700e7b9953dede6f082daaa20b044ddf7a6cb8"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.7.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "db0246b437be60503bccda56cc4c3817110ee70bcd6c0dae3001731e0b63b49d"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
