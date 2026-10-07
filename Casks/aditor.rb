cask "aditor" do
  version "0.1.1"
  # Placeholder until v0.1.1 is published: take the zip's line from the
  # release's SHA256SUMS.txt.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  # The zip, not the DMG: every release ships the zip, while the DMG is
  # skipped whenever Tauri's DMG packaging fails.
  url "https://github.com/lazap/aditor/releases/download/v#{version}/Aditor_#{version}_aarch64.zip",
      verified: "github.com/lazap/aditor/"

  name "Aditor"
  desc "Lightweight editor whose main pane is an agent CLI"
  homepage "https://github.com/lazap/aditor"

  # Releases are built for Apple Silicon only.
  depends_on arch: :arm64
  # Keep in step with bundle.macOS.minimumSystemVersion in tauri.conf.json.
  depends_on macos: ">= :sonoma"

  app "Aditor.app"

  # Builds are ad-hoc signed but not notarized, so Gatekeeper would block the
  # first launch of a quarantined copy. Clearing the flag here makes the
  # install open like any other app.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Aditor.app"]
  end

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
