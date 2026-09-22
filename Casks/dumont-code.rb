cask "dumont-code" do
  arch arm: "arm64", intel: "x64"

  version "1.18.32-dumont.1"
  sha256 arm:   "9364d668739bf0ac8b08b680b1e6e7b493b18e92a3e930c1070df09fe079d90c",
         intel: "6df86b51aba9ca86bf056f1c3f1efd5c812cff24db9f34fc98faba8f0635bfa7"

  url "https://dumont.au/desktop/code/prod/#{version}/dumont-code-desktop-mac-#{arch}.dmg"
  name "Dumont Code"
  desc "Dumont's agentic coding desktop app, any LLM"
  homepage "https://dumont.au/desktop/code/"

  # The app ships electron-updater pointed at dumont.au and it is verified working
  # (v1 -> v2 tested end to end). Without this, brew would fight the in-app updater
  # and report the app as outdated every time it updates itself.
  auto_updates true

  depends_on macos: ">= :monterey"

  app "Dumont Code.app"

  zap trash: [
    "~/Library/Application Support/ai.dumont.code",
    "~/Library/Caches/ai.dumont.code",
    "~/Library/HTTPStorages/ai.dumont.code",
    "~/Library/Logs/Dumont Code",
    "~/Library/Preferences/ai.dumont.code.plist",
    "~/Library/Saved Application State/ai.dumont.code.savedState",
  ]
end
