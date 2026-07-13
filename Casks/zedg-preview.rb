cask "zedg-preview" do
  version "1.11.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.3-pre/zedg-zh-cn-macos-aarch64-v1.11.3-pre.dmg"
    sha256 "33f3912af47b45fe7992e3d9630217a50498ea4e977261b2ff89a17d4b559df6"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.3-pre/zedg-zh-cn-macos-x86_64-v1.11.3-pre.dmg"
    sha256 "e7194c6706af43d0811c38be7debdf1af2d3eedfe51aa63c8c420a5e61a38b95"
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
