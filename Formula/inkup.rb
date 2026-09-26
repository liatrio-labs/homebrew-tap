class Inkup < Formula
  desc "The InkUp host: the server, the store, the TUI and `mcp install`"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.3.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "7253c7b94ca8de55b43fd41f2cc31f0aea1cccac2d161bc4103c9824c9bf7862"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.3.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "2351b868690b69029942054f16d95d42a04096cdc6c3db5375bffd46fb8d2527"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.3.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "654fa4539caed69f6bf5661434c5daf79d6b08b969d1019426b37c6b7080265b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.3.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "42eccb91163859ab3139fb9205b759109f89bd137f4d038cd6358e40ba3a6a9b"
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
