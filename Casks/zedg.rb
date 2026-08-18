cask "zedg" do
  version "1.15.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.1/zedg-zh-cn-macos-aarch64-v1.15.1.dmg"
    sha256 "e912a7ba4fb60d71da6d3f2d6097b732aa873088e7b9c3e3bba22b092d27449e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.1/zedg-zh-cn-macos-x86_64-v1.15.1.dmg"
    sha256 "4e58fb44fcda0b0508cc181e35322ca0093dcd4e289f5152a2bac4d791ecd906"
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
