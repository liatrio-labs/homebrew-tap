class Inkup < Formula
  desc "Host for spoken and drawn web page reviews: server, store, TUI and MCP setup"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.17.0"
  license "MIT"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :stable
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # Built from the release's own archives (scripts/formula.ts), so installing never compiles and needs no Xcode.
  bottle do
    root_url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.17.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "1b1ce7d01774ad6019170b90f283c95d61b8e394d6a315d1b95dfe6366d93e7f"
    sha256 cellar: :any_skip_relocation, big_sur:       "f0f6f4bb89f2087d924d121b2c4facaf2b881b61b51afba745ebae4bcdb9c149"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "3d4486fa438d4cfb3291ac2ee9a98ac7b4a411da349a53864cc5914ad908ee21"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f02b2c30c7a371226eced5dda5275a4655f2dc1bea367b8309c1bc3b414a9497"
  end

  on_macos do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.17.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "946c2a486f9a961bb513de93fd66098fcb9f46d79f33ecf202d4890669b53b4f"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.17.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "5981cbecba505f4b0f03bd56420b098e27c564d131667ff9faa3b813595e0396"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.17.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "435631122cb96be9dbdf1c5c5db311f02967f87b0b0701a32db217e4d2952601"
    end
    on_intel do
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.17.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "db3f6ee87556b158a6d41e0d4682dfca8decc740cf37b73e2c22d11d0e750500"
    end
  end

  def install
    bin.install "inkup"
  end

  test do
    assert_equal "inkup #{version}", shell_output("#{bin}/inkup --version").strip
  end
end
