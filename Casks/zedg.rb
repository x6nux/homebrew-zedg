cask "zedg" do
  version "0.233.8"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.8/zedg-zh-cn-macos-aarch64-v0.233.8.dmg"
    sha256 "d78b79d7924594fcf4aae84be910d251551f9bb286a83436532f3d5ba20d83ac"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.8/zedg-zh-cn-macos-x86_64-v0.233.8.dmg"
    sha256 "c4febbfb37f6ce1b34355205bdf7a609ffbf393c1aaa05a790e4034a8bbb6ad0"
  end

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
