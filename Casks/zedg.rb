cask "zedg" do
  version "0.224.5"
  sha256 "585feaabc90030132c33b63902e73a983ae5c59cbc8c394f83ffeed5884f4fd5"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.5/zedg-zh-cn-macos-aarch64-v0.224.5.dmg"
  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
