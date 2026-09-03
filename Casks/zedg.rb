cask "zedg" do
  version "1.18.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0/zedg-zh-cn-macos-aarch64-v1.18.0.dmg"
    sha256 "389434a887583b54077766fa0384b7d9f8c00673d2fc273557e98018c7c7d33a"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0/zedg-zh-cn-macos-x86_64-v1.18.0.dmg"
    sha256 "dfd5b5d539710e5c467035c8f4813d464c2b347357bdc1924945a2c326402f45"
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
