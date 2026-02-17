cask "zedg" do
  version "0.223.4"
  sha256 "2b50cae66647e621aa89a56707e772c9c747039c004b5cec2662bc6d44afc069"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.223.4/zedg-zh-cn-macos-aarch64-v0.223.4.dmg"
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
