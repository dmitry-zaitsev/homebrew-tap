class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.5.1"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.5.1/istoria-1.5.1-aarch64-apple-darwin.app.tar.gz"
  sha256 "e3c2ea6888c77cbd886bb4e1e17dbb7e660115cae424da5b37975241be7b0388"

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
