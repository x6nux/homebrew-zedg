cask "zedg" do
  version "1.18.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0/zedg-zh-cn-macos-aarch64-v1.18.0.dmg"
    sha256 "123c73d0185ea5d2aebd617c2a8fcdc6513dbcbef69ee0593edcafc526ba46af"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0/zedg-zh-cn-macos-x86_64-v1.18.0.dmg"
    sha256 "ed87d3eadc5b59ca62fdb43574ed51dc29901348527c027beef9e861ad4a8830"
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
