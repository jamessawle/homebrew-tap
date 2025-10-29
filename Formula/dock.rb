class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2371122000fb8d0eb02623aad076e3f6690d5092b9e1f14c73fb8ff8baf09fb6"
  license "MIT"

  depends_on "yq"
  depends_on "dockutil"

  # Mandate macOS only
  on_macos do
    def install
      bin.install "dock"
    end
  end

  on_linux do
    odie "dock is only supported on macOS."
  end

  test do
    assert_match(/\A[dD]ock \d+\.\d+\.\d+/, shell_output("#{bin}/dock --version"))
  end
end
