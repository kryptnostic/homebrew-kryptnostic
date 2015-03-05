class Kryptnostic < Formula
  homepage "http://www.kryptnostic.com"
  url "http://www.kryptnostic.com/download/kryptnostic-cli-0.0.0.zip"
  version "0.0.0"
  sha1 "d9b01eaaa088bc04726aa6fd0a69ed13bdb47227"

  depends_on :java

  def install
    prefix.install "bin/kryptnostic-cli"
    lib.install Dir["./lib/*.jar"]
    (HOMEBREW_PREFIX/"bin").install_symlink prefix/"kryptnostic-cli" => "kryptnostic"
  end

  test do
    system "kryptnostic-cli"
  end
end