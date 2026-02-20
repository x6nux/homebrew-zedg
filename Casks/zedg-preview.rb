cask "zedg-preview" do
  version "0.225.3-pre.1"
  sha256 "e67d4b82b9670b0d6e00d5bd55a360d819ca000a9f0bb64468aaf9e20f4eed77"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.3-pre.1/zedg-zh-cn-macos-aarch64-v0.225.3-pre.dmg"
  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
  homepage "https://github.com/x6nux/zed-globalization"

  depends_on macos: ">= :ventura"

  app "ZedG.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.ZedG",
    "~/Library/Preferences/dev.zed.ZedG.plist",
  ]
end
