cask "netraluiswhisper" do
  version "0.1.5"
  sha256 "1c08672bce3031c74aa9edb7270f5903921650be117dc837854e5438187ec23d"

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
