cask "zedg-preview" do
  version "1.6.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.3-pre/zedg-zh-cn-macos-aarch64-v1.6.3-pre.dmg"
    sha256 "ea9d4f248c73f0d0d39d241215d98f15a76a1c78465d305df6afb0073ea89800"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.3-pre/zedg-zh-cn-macos-x86_64-v1.6.3-pre.dmg"
    sha256 "3ed8417257f6b470f920053abbf95883254e42ff46967adb77ef5b8ac9ced569"
  end

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
