class Kryptnostic < Formula
  homepage "https://www.kryptnostic.com"
  url "https://www.kryptnostic.com/download/cli-1.1.1.zip"
  version "1.1.1"
  sha1 "9a9198ab00fea286ecd66758f4bb5ca03a186824"

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
