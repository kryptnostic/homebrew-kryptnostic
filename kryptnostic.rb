class Kryptnostic < Formula
  homepage "https://www.kryptnostic.com"
  url "https://www.kryptnostic.com/download/cli-1.1.2.zip"
  version "1.1.2"
  sha1 "bf6546fcb7e0eebfd055081fe6bd395399b6a3f1"

  depends_on :java

  def install
    inreplace "bin/cli", /APP_HOME="`pwd -P`"/, "APP_HOME=\"#{libexec}\""
    inreplace "bin/cli", /\$APP_HOME\/lib\//, "$APP_HOME/"
    prefix.install "bin/cli"
    libexec.install Dir["./lib/*.jar"]
    (HOMEBREW_PREFIX/"bin").install_symlink prefix/"cli" => "kryptnostic"
  end

  test do
    system "kryptnostic"
  end
end
