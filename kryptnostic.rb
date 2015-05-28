class Kryptnostic < Formula
  homepage "https://www.kryptnostic.com"
  url "https://www.kryptnostic.com/download/kryptnostic-cli-1.1.0.zip"
  version "1.1.0"
  sha1 "e168928ce66bed29521f032b8314fefeb3dd4fb8"

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
