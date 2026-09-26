class Inkup < Formula
  desc "The InkUp host: the server, the store, the TUI and `mcp install`"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.4.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "45e2d6a33ef9c3b47f174a8860e7df06afab233dde2613c9a5a090e7c623a544"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.4.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "89823efaa6ee134c308fed705ce2f22b5d31b4db8e5712f33b9455bf7f621c80"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.4.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ffae48b9d1d093486f3713e404f88c0968d0a6f5d7e3ea14e05671656e210774"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.4.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "86f66d6d001d9774849587c4ff6147719eb1ec93f052c46c7f9a6e3bc5b7785d"
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
