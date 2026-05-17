class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.4.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.4.0/istoria-1.4.0-aarch64-apple-darwin.app.tar.gz"
  sha256 "bbda3d8f8ad2aae9d99927be0c97fa0033c96363251f979fcdbc1a95f439d006"

  def install
    prefix.install "istoria.app"
    bin.write_exec_script prefix/"istoria.app/Contents/MacOS/istoria"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
