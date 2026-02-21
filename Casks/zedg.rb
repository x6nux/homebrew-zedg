cask "zedg" do
  version "0.224.10"
  sha256 "94e9ed96ae657d68ebe2e0f8b393a1b1447f3199c2ffd260fc6dba99515f50a4"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.10/zedg-zh-cn-macos-aarch64-v0.224.10.dmg"
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
