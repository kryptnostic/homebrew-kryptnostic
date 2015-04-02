class Kryptnostic < Formula
  homepage "https://www.kryptnostic.com"
  url "https://www.kryptnostic.com/download/kryptnostic-cli-0.0.8.zip"
  version "0.0.8"
  sha1 "f22f536b23040ea637bbacc4738ca575703ad8db"

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