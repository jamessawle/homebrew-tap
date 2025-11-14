class Dock < Formula
  include Language::Python::Virtualenv

  desc "macOS Dock Manager (YAML-driven, dry-run friendly)"
  homepage "https://github.com/jamessawle/dock"
  url "https://github.com/jamessawle/dock/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "16737ee59876b54167ed722d8bfdcaf91208db5568fc52d19f9f53371255b1ab"
  license "MIT"
  head "https://github.com/jamessawle/dock.git", branch: "main"

  depends_on "dockutil"
  depends_on "libyaml"
  depends_on :macos
  depends_on "python@3.14"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9/attrs-25.4.0.tar.gz"
    sha256 "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
  end

  resource "cattrs" do
    url "https://files.pythonhosted.org/packages/6e/00/2432bb2d445b39b5407f0a90e01b9a271475eea7caf913d7a86bcb956385/cattrs-25.3.0.tar.gz"
    sha256 "1ac88d9e5eda10436c4517e390a4142d88638fe682c436c93db7ce4a277b884a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/46/61/de6cd827efad202d7057d93e0fed9294b96952e188f7384832791c7b2254/click-8.3.0.tar.gz"
    sha256 "e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  def install
    virtualenv_install_with_resources

    # Install shell completions
    bash_completion.install "completions/dock.bash" => "dock"
    zsh_completion.install "completions/_dock"
  end

  test do
    # Test that the command is available and shows version
    assert_match "version", shell_output("#{bin}/dock --version")

    # Test that the command shows help
    assert_match "Manage macOS Dock", shell_output("#{bin}/dock --help")

    # Test validate command with a simple config
    (testpath/"test-config.yml").write <<~EOS
      apps:
        - Safari
      settings:
        autohide: false
    EOS

    assert_match "valid", shell_output("#{bin}/dock validate --file #{testpath}/test-config.yml")
  end
end
