cask "zedg" do
  version "1.16.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.3/zedg-zh-cn-macos-aarch64-v1.16.3.dmg"
    sha256 "084587f362d8f4c434b685da22dbcac99fbc6d65d6c89100d2fcf13261a72ab0"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.3/zedg-zh-cn-macos-x86_64-v1.16.3.dmg"
    sha256 "59f9d02cd10e1b0709f2e8b222219387f17ff63177caff640b003afa50d6f6e3"
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
