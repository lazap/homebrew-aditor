cask "aditor" do
  # Tauri names its macOS DMGs with these exact fragments, so `arch` doubles as
  # the filename token below.
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/lazap/aditor/releases/download/v#{version}/Aditor_#{version}_#{arch}.dmg",
      verified: "github.com/lazap/aditor/"

  name "Aditor"
  desc "Lightweight editor whose main pane is an agent CLI"
  homepage "https://github.com/lazap/aditor"

  # Keep in step with bundle.macOS.minimumSystemVersion in tauri.conf.json.
  depends_on macos: ">= :sonoma"

  app "Aditor.app"

  caveats <<~EOS
    Aditor is not yet signed with an Apple Developer ID certificate, so macOS
    Gatekeeper will refuse to open it after installation. To allow it:

      xattr -dr com.apple.quarantine "/Applications/Aditor.app"

    This step goes away once signed builds are published.
  EOS

  # The UI keeps its state in the webview's localStorage, which WebKit stores
  # under the bundle identifier rather than alongside the app.
  zap trash: [
    "~/Library/Application Support/dev.lazap.aditor",
    "~/Library/Caches/dev.lazap.aditor",
    "~/Library/HTTPStorages/dev.lazap.aditor",
    "~/Library/Preferences/dev.lazap.aditor.plist",
    "~/Library/Saved Application State/dev.lazap.aditor.savedState",
    "~/Library/WebKit/dev.lazap.aditor",
  ]
end
