class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.5.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.5.0/istoria-1.5.0-aarch64-apple-darwin.app.tar.gz"
  sha256 "0cd2ae404c403d2b154082d1daa353490b6f7481fdb9813d7bf467e74b3cb935"

  def install
    prefix.install "istoria.app"
    # The CLI is the headless core (forwards `cmd | istoria` to the app and
    # launches it when closed). Contents/MacOS/istoria is the Electron GUI
    # launcher and must NOT be the CLI.
    bin.write_exec_script prefix/"istoria.app/Contents/Resources/istoria-core"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
