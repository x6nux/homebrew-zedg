cask "zedg" do
  version "0.224.7"
  sha256 "dc0a131e59645cd57f564f7c2516e896ba39c82f926fcb384199f6a6c5482f1e"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.7/zedg-zh-cn-macos-aarch64-v0.224.7.dmg"
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
