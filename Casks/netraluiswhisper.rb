cask "netraluiswhisper" do
  version "0.1.2"
  sha256 "0e2d28c9f6ec0772573d574e0ca57426974d0bc86fd2082d232c39508bc986f6"

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
