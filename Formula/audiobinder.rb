class Audiobinder < Formula
  desc "Create m4b audiobooks from MP3 folders and metadata.json"
  homepage "https://github.com/jamessawle/audiobinder"
  url "https://github.com/jamessawle/audiobinder/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "304ff62e3141571db95c852bef6da5e407d375c626a81fd62a4b50712d6aaf46"
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
