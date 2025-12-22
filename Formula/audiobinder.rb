class Audiobinder < Formula
  desc "Create m4b audiobooks from MP3 folders and metadata.json"
  homepage "https://github.com/jamessawle/audiobinder"
  url "https://github.com/jamessawle/audiobinder/releases/download/v0.0.1/audiobinder-0.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "jq"

  def install
    bin.install "audiobinder.sh" => "audiobinder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/audiobinder -v")
  end
end
