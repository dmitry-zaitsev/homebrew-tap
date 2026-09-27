class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.5.2"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.5.2/istoria-1.5.2-aarch64-apple-darwin.app.tar.gz"
  sha256 "cdf38fc9ec179f6c5d7d97f709c9b9d9ed6f710aa4b08927fcf271898f471558"

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
