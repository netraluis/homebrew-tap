cask "netraluiswhisper" do
  version "0.1.0"
  sha256 "8598422282cf7e43c61c617685fee941e6d8c141889f704aac56461067034d0f"

  url "https://github.com/netraluis/netraluisWhisper/releases/download/v#{version}/netraluisWhisper.dmg"
  name "netraluisWhisper"
  desc "Local push-to-talk voice dictation for macOS"
  homepage "https://github.com/netraluis/netraluisWhisper"

  depends_on macos: ">= :ventura"

  app "netraluisWhisper.app"

  zap trash: [
    "~/Library/Application Support/netraluiswhisper",
  ]
end
