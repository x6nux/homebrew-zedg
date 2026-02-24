cask "zedg-preview" do
  version "0.225.7-pre.1"
  sha256 "40c045368e8a040878d8f6201d0921faae5416590b155dd9e22344a1a6e85e0d"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.7-pre.1/zedg-zh-cn-macos-universal-v0.225.7-pre.dmg"
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
