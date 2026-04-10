cask "zedg" do
  version "0.231.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.2/zedg-zh-cn-macos-aarch64-v0.231.2.dmg"
    sha256 "773a5a737e48317d6c31ad0fb5508ef99ecf785cefd9c59a3877add0559011a8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.2/zedg-zh-cn-macos-x86_64-v0.231.2.dmg"
    sha256 "d255a57042aec195fdf2c731793916714ac50820455d8e207c36ee3064acf2e8"
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
