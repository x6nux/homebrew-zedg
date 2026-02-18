cask "zedg" do
  version "0.223.5"
  sha256 "5267c499b0f4175f9ab6cf2bb92c894a51acb1439f9eabdc6c6c3ae76422cd10"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.223.5/zedg-zh-cn-macos-aarch64-v0.223.5.dmg"
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
