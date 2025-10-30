class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "956b9bfe20c9a74118bb381f349e6fca073a94f73e3c4a7ec70c3dbcfa8f189f"
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
