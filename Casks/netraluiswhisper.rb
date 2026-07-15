cask "netraluiswhisper" do
  version "0.1.9"
  sha256 "6d4437fa4f0debecfab9fefcc4c1ca53a85ef7e9b46192eb1a7860d2a3c472ac"

  url "https://github.com/netraluis/netraluisWhisper/releases/download/v#{version}/netraluisWhisper.dmg"
  name "netraluisWhisper"
  desc "Local push-to-talk voice dictation"
  homepage "https://github.com/netraluis/netraluisWhisper"

  depends_on macos: :ventura

  app "netraluisWhisper.app"

  # The app ships with an ad-hoc signature and is not notarized, so Gatekeeper
  # otherwise reports it as "damaged". Strip the download quarantine and re-sign
  # ad-hoc in place so it launches without the user touching the terminal.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/netraluisWhisper.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/netraluisWhisper.app"]
  end

  zap trash: [
    "~/Library/Application Support/netraluisWhisper",
    "~/Library/Preferences/com.netraluis.netraluiswhisper.plist",
    "~/Library/Saved Application State/com.netraluis.netraluiswhisper.savedState",
  ]
end
