cask "netraluiswhisper" do
  version "0.1.1"
  sha256 "42ea3fb6c0584f1ad2e0f07007f6265ab255eeec7cfdf0aa60cd8ff9bacf451d"

  url "https://github.com/netraluis/netraluisWhisper/releases/download/v#{version}/netraluisWhisper.dmg"
  name "netraluisWhisper"
  desc "Local push-to-talk voice dictation for macOS"
  homepage "https://github.com/netraluis/netraluisWhisper"

  depends_on macos: :ventura

  app "netraluisWhisper.app"

  zap trash: [
    "~/Library/Application Support/netraluiswhisper",
  ]
end
