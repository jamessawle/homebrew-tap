cask "sbxflow" do
  version "0.1.1"

  on_arm do
    sha256 "375cd52c497e882d2e19d1a088fd895745deb5847dc7a0ca072f0a5569c41b24"

    url "https://github.com/jamessawle/sbxflow/releases/download/v#{version}/sbxflow_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "3c478515c35e64a96b9f6158223732eb5cf7cf1e574f34fc97843c06829803f7"

    url "https://github.com/jamessawle/sbxflow/releases/download/v#{version}/sbxflow_#{version}_darwin_amd64.tar.gz"
  end

  name "sbxflow"
  desc "Apply a repository's Docker Sandbox configuration and lifecycle"
  homepage "https://github.com/jamessawle/sbxflow"

  binary "sbxflow"
end
