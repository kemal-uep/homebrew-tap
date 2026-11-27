class Uep < Formula
  desc "x/x: terminal security and maintenance toolkit for macOS"
  homepage "https://github.com/kemal-uep/x-x"
  url "https://github.com/kemal-uep/x-x/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "51654e69c92154719a19a8cabfbb7f6be216f1f0e7ca583c7451b93c89bf6eb4"
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
