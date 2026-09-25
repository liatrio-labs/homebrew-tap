class Inkup < Formula
  desc "The InkUp host: the server, the store, the TUI and `mcp install`"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.2.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "bd410e25cbf01fdaa206ce0790fab49f24cfca529205578ef8ae38f85f2d8b0c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.2.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "33f4b1913978bdc483564f76f1deaa74e6b83c4e3d823fab58bc1dfca637e710"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.2.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2171023a72ea2e4bad8b59df467b7425e8e751777f8b156081041d938c8f3604"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.2.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "18c0f09589e9a9a7dfd982cc53627961d6ca0c5f424f282f1b1d119d962c4950"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "inkup"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "inkup"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "inkup"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "inkup"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
