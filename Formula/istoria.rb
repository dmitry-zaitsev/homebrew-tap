class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.2.1"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.2.1/istoria-1.2.1-aarch64-apple-darwin.app.tar.gz"
  sha256 "2e05b932952c6aa7e9d09094fdf80e0107d917a0e64238c9605c5e0a3a9a2b54"

  def install
    prefix.install "istoria.app"
    bin.write_exec_script prefix/"istoria.app/Contents/MacOS/istoria"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
