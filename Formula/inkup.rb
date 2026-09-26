class Inkup < Formula
  desc "The InkUp host: the server, the store, the TUI and `mcp install`"
  homepage "https://github.com/liatrio-labs/inkup"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.5.0/inkup-aarch64-apple-darwin.tar.xz"
      sha256 "a729e9d43b49e9ce78267b776d90f90b9ad32bbc520509ce43efd43a2332e9a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.5.0/inkup-x86_64-apple-darwin.tar.xz"
      sha256 "4ad144b5ecdea506ba021f4bb4ef7cf3823d2f16eefd87b3a926fa97570e466b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.5.0/inkup-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a5ae6ae4e6b30f08696fc918d47453afd61114c017702bb3834808ee38ff6255"
    end
    if Hardware::CPU.intel?
      url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v0.5.0/inkup-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0786d0a834b2ac60e474a45d983d2d29b7cbf4dc30bbf2329fee1455d1088095"
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
