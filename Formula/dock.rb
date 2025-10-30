class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3349f27b9ce1122877c821f6431772bbb0d77da3f1d0f04e64e89c420e323fe3"
  license "MIT"

  depends_on "dockutil"
  depends_on :macos
  depends_on "yq"

  def install
    libexec.install "dock", "lib"
    bin.install_symlink libexec/"dock"
  end

  test do
    assert_match(/\A[dD]ock \d+\.\d+\.\d+/, shell_output("#{bin}/dock --version"))
  end
end
