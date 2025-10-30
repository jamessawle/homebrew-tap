class Dock < Formula
  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "4703014326498be0879dd62c6e115d5262698cbe7afa0c13fc0402c5337fc0a2"
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
