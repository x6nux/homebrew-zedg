cask "zedg" do
  version "1.13.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.2/zedg-zh-cn-macos-aarch64-v1.13.2.dmg"
    sha256 "7b5b13784387108fe62523c2d98bee088c7ca92a46459de287adb5a7ea0beb3b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.2/zedg-zh-cn-macos-x86_64-v1.13.2.dmg"
    sha256 "e07d33dd1fcd4d14f380ccdf2ea4e7e90ef38374ede72e37b24a72e0b4ba3382"
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
