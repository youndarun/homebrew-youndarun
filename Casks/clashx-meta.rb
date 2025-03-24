cask "clashx-meta" do
  version "1.4.10"
  sha256 "d50ff0b05f7669ba7d42ad1077a04a9aa9fb9847e4508401929ea72645528ebf"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "clashx-meta"
  desc "A rule based proxy For Mac base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "ClashX Meta.app"

  uninstall launchctl: "com.metacubex.ClashX.ProxyConfigHelper",
            quit:      "com.metacubex.ClashX",
            delete:    [
              "/Library/LaunchDaemons/com.metacubex.ClashX.ProxyConfigHelper.plist",
              "/Library/PrivilegedHelperTools/com.metacubex.ClashX.ProxyConfigHelper",
            ]

  zap trash: [
    "/Users/later/Library/Application Support/com.metacubex.ClashX.meta",
    "/Users/later/Library/HTTPStorages/com.metacubex.ClashX.meta",
    "/Users/later/Library/Logs/ClashX Meta",
    "/Users/later/Library/Caches/com.MetaCubeX.ClashX.meta",
    "/Users/later/Library/Preferences/com.metacubex.ClashX.meta.plist",
    "/Library/Logs/DiagnosticReports/com.metacubex.ClashX.ProxyConfigHelper.meta*.diag"
  ]
end