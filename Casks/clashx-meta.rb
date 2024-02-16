cask "clashx-meta" do
  version "1.3.10"
  sha256 "1878df748675e1e35a9084b136e109e6810c685082842830b13be2c8806aad0b"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "clashx-meta"
  desc "A rule based proxy For Mac base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    skip "No need for new versions"
  end

  depends_on macos: ">= :mojave"

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