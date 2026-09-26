cask "inkup" do
  version "0.4.0"
  sha256 "187ae73bd0180cde6d55b31e9bd50e174086514fa976ac007ad4754ed5208f66"

  url "https://github.com/liatrio-labs/inkup/releases/download/inkup-v#{version}/InkUp_#{version}_universal.dmg"
  name "InkUp"
  desc "Turn spoken and drawn web page reviews into change items for coding agents"
  homepage "https://github.com/liatrio-labs/inkup"

  # The repo also releases the browser extensions, on inkup-chrome-v* and inkup-firefox-v* tags.
  livecheck do
    url :url
    regex(/^inkup-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # tauri.conf.json sets no minimumSystemVersion, so the app takes Tauri's default, 10.13. That is older than any
  # macOS Homebrew supports, and Homebrew refuses a floor it has dropped, so the cask names none.
  depends_on :macos

  app "InkUp.app"

  # The host's data dir, ~/Library/Application Support/dev.inkup.inkup, is left out: the inkup CLI uses it too.
  zap trash: [
    "~/Library/Application Support/dev.inkup.desktop",
    "~/Library/Caches/dev.inkup.desktop",
    "~/Library/HTTPStorages/dev.inkup.desktop",
    "~/Library/Preferences/dev.inkup.desktop.plist",
    "~/Library/Saved Application State/dev.inkup.desktop.savedState",
    "~/Library/WebKit/dev.inkup.desktop",
  ]
end
