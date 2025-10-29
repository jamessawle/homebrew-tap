class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "89abed05d4c01bb20c9facb71dbbfdb0252cbdb0dc0b45306d49091183062c56"
  license "MIT"

  # Enforce macOS (don’t try to install on Linuxbrew)
  depends_on :macos

  depends_on "dockutil"
  depends_on "yq"

  def install
    bin.install "dock"
  end

  test do
    assert_match(/\A[dD]ock \d+\.\d+\.\d+/, shell_output("#{bin}/dock --version"))
  end
end
