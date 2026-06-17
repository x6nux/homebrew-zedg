cask "zedg" do
  version "1.7.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.2/zedg-zh-cn-macos-aarch64-v1.7.2.dmg"
    sha256 "d9be0bb04aa163c771bd3580052eabc05397aeca0a6bcc5440cc9f9ddb8b26e4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.2/zedg-zh-cn-macos-x86_64-v1.7.2.dmg"
    sha256 "a58f93a0b4dde9eafbe719bf64e4cfce2546cbb17d665ff5786eaec07dddac9d"
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
