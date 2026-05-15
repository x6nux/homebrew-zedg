cask "zedg-preview" do
  version "1.3.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.3-pre/zedg-zh-cn-macos-aarch64-v1.3.3-pre.dmg"
    sha256 "7943e48ac64fd6d18280bdfaf8179f6e2562c891814d819cdc5480c73b634668"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.3-pre/zedg-zh-cn-macos-x86_64-v1.3.3-pre.dmg"
    sha256 "22a787ad9de1664635b8c5934c72c6d23ea9339eb26d4f4a6271af009593aa28"
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
