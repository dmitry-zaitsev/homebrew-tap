class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.4.4"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.4.4/istoria-1.4.4-aarch64-apple-darwin.app.tar.gz"
  sha256 "858f36666517ac9012c710242cca8d852b1397b397a3fba92f75707a78d27a89"

  def install
    prefix.install "istoria.app"
    bin.write_exec_script prefix/"istoria.app/Contents/MacOS/istoria"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
