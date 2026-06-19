class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.4.5"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.4.5/istoria-1.4.5-aarch64-apple-darwin.app.tar.gz"
  sha256 "9729fe2668fe44b5e59ad5880b772bf404dbaef96aaef5f7f575651c73e08829"

  def install
    prefix.install "istoria.app"
    bin.write_exec_script prefix/"istoria.app/Contents/MacOS/istoria"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
