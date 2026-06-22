cask "zedg-preview" do
  version "1.8.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.2-pre/zedg-zh-cn-macos-aarch64-v1.8.2-pre.dmg"
    sha256 "ea3211d31afd8fa17dbf011eec22a5358b95060d669c8e94a71f9b64e9fcc047"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.2-pre/zedg-zh-cn-macos-x86_64-v1.8.2-pre.dmg"
    sha256 "23838dfd61175dd624d0db87b9f02d23bf0cf089099e4a13bddca20f028bfa66"
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
