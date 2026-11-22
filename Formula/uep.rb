class Uep < Formula
  desc "x/x: terminal security and maintenance toolkit for macOS"
  homepage "https://github.com/kemal-uep/x-x"
  url "https://github.com/kemal-uep/x-x/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "c6d482344ec53e62ba9912be20f618a9820a723aab819e22a23df8f95e242e24"
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
