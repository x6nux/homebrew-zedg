cask "zedg" do
  version "1.0.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.0.0/zedg-zh-cn-macos-aarch64-v1.0.0.dmg"
    sha256 "0fd22f7c57191c102838f6ee0b060b7b3bad2ca5671760d366bfed38bb046ff2"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.0.0/zedg-zh-cn-macos-x86_64-v1.0.0.dmg"
    sha256 "c7808965323001ad2ee7b589ff2f5e283a71dc3ca4c3076cc11da2b3fbd4eab0"
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
