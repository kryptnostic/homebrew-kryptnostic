class Kryptnostic < Formula
  homepage "http://www.kryptnostic.com"
  url "http://www.kryptnostic.com/download/kryptnostic-cli-0.0.1.zip"
  version "0.0.1"
  sha1 "82956eb61b471d10103b76ae33ab02ea37d9c058"

  depends_on :java

  def install
    inreplace "bin/kryptnostic-cli", /APP_HOME="`pwd -P`"/, "APP_HOME=\"#{libexec}\""
    inreplace "bin/kryptnostic-cli", /\$APP_HOME\/lib\//, "$APP_HOME/"
    prefix.install "bin/kryptnostic-cli"
    libexec.install Dir["./lib/*.jar"]
    (HOMEBREW_PREFIX/"bin").install_symlink prefix/"kryptnostic-cli" => "kryptnostic"
  end

  test do
    system "kryptnostic"
  end
end