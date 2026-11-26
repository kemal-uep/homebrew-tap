class Uep < Formula
  desc "x/x: terminal security and maintenance toolkit for macOS"
  homepage "https://github.com/kemal-uep/x-x"
  url "https://github.com/kemal-uep/x-x/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "bbc053d9f4f51ca2e61929f22421b2e7f148506692bf89a87784a181c86148f3"
  license "MIT"

  depends_on "clamav"
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
