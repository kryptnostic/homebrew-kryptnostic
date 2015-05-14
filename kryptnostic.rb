class Kryptnostic < Formula
  homepage "https://www.kryptnostic.com"
  url "https://www.kryptnostic.com/download/kryptnostic-cli-1.1.0.zip"
  version "1.1.0"
  sha1 "d317ed3c34620b58b0c00d43bdaafef0cb1ee204"

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
