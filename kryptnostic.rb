class Kryptnostic < Formula
  homepage "http://www.kryptnostic.com"
  url "http://www.kryptnostic.com/download/kryptnostic-cli-0.0.0.zip"
  version "0.0.0"
  sha1 "120942a89016bc821798c1446b11a5466fa12425"

  depends_on :java

  def install
    inreplace "bin/kryptnostic-cli", /APP_HOME="`pwd -P`"/, "APP_HOME=\"#{lib}\""
    prefix.install "bin/kryptnostic-cli"
    (HOMEBREW_PREFIX/"bin").install_symlink prefix/"kryptnostic-cli" => "kryptnostic"
  end

  test do
    system "kryptnostic-cli"
  end
end