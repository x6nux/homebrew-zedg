cask "zedg" do
  version "0.223.3"
  sha256 "d2d42dc2b04299aa589a45a369334fa39438afd13b09cc8282918339c701b159"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.223.3/zedg-zh-cn-macos-aarch64-v0.223.3.dmg"
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
