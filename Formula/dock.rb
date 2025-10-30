class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "37e92eccc1db08e78e4c11260d23c86c76787fee633d231a3c97b993656f43ad"
  license "MIT"

  depends_on "dockutil"
  depends_on :macos
  depends_on "yq"

  def install
    libexec.install "dock", "lib"
    bin.install_symlink libexec/"dock"
    bash_completion.install "completions/dock.bash" => "dock"
    zsh_completion.install "completions/_dock"
  end

  test do
    assert_match(/\A[dD]ock \d+\.\d+\.\d+/, shell_output("#{bin}/dock --version"))
  end
end
