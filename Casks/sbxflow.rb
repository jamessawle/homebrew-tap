cask "sbxflow" do
  version "0.1.0"

  on_arm do
    sha256 "612cfdfe12321bb9899ae56d06d24bdf7f3d73bc36d47cd95989db92190dd952"

    url "https://github.com/jamessawle/sbxflow/releases/download/v#{version}/sbxflow_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "79bf68bebd5922e9c05e2fcd3b3bcf1f5a6f66a922d1a86b96580d4d494712ff"

    url "https://github.com/jamessawle/sbxflow/releases/download/v#{version}/sbxflow_#{version}_darwin_amd64.tar.gz"
  end

  name "sbxflow"
  desc "Apply a repository's Docker Sandbox configuration and lifecycle"
  homepage "https://github.com/jamessawle/sbxflow"

  binary "sbxflow"
end
