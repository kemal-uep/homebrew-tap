class Uep < Formula
  desc "x/x: terminal security and maintenance toolkit for macOS"
  homepage "https://github.com/kemal-uep/x-x"
  url "https://github.com/kemal-uep/x-x/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "6bd177161c246eac33d6305b917d4be98de3d02501dfb43983140e0ad89b4a65"
  license "MIT"

  depends_on "clamav"
  depends_on "yara"
  depends_on :macos

  def install
    libexec.install "uep", "lib", "art"
    bin.install_symlink libexec/"uep"
  end

  def caveats
    <<~EOS
      Run:
        uep

      Logs, reports and quarantine are kept in ~/.x-x
    EOS
  end

  test do
    assert_predicate libexec/"lib/ui.zsh", :exist?
    system "zsh", "-n", libexec/"uep"
  end
end
