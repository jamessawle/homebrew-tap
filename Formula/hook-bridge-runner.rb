class HookBridgeRunner < Formula
  include Language::Python::Virtualenv

  desc "Runner that bridges a Harness's native hook events to hook-bridge Hooks"
  homepage "https://github.com/jamessawle/hook-bridge"
  url "https://files.pythonhosted.org/packages/c7/39/208eace69b4fe4b458615a1c090f8686257407a189b627f7ce7d64948da4/hook_bridge_runner-0.1.1.tar.gz"
  sha256 "a6e1cd7c50adc6e26c988b8c4b2de936d3ca32d77160bf4401e4a32e0f144b5c"
  license "MIT"

  depends_on "python@3.14"
  depends_on "uv"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/hook-bridge-runner", "--help"
  end
end
