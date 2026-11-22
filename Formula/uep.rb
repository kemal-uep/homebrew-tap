class Uep < Formula
  desc "x/x: terminal security and maintenance toolkit for macOS"
  homepage "https://github.com/kemal-uep/x-x"
  url "https://github.com/kemal-uep/x-x/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "536f51be09449d049d0f32567b4677e3734ebbcae4d0d7139d840c18f4103357"
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
