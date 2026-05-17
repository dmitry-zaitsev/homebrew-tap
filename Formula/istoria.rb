class Istoria < Formula
  desc "Local log viewer — pipe stdout into a native window"
  homepage "https://github.com/dmitry-zaitsev/istoria"
  version "1.3.3"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/dmitry-zaitsev/istoria-releases/releases/download/v1.3.3/istoria-1.3.3-aarch64-apple-darwin.app.tar.gz"
  sha256 "65f3e5393799178dadaeb7794dd52c1f18937830d271e5932fc330e81ece2e6f"

  def install
    prefix.install "istoria.app"
    bin.write_exec_script prefix/"istoria.app/Contents/MacOS/istoria"
  end

  test do
    system "#{bin}/istoria", "--version"
  end
end
