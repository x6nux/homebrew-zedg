cask "zedg" do
  version "0.224.11.1"
  sha256 "d1dd5c80966d7f8b982d4e4e9a65c3ebd356a2944dea754828d462af8a02191e"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.11.1/zedg-zh-cn-macos-universal-v0.224.11.dmg"
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
