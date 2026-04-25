cask "zedg" do
  version "0.233.10"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.10/zedg-zh-cn-macos-aarch64-v0.233.10.dmg"
    sha256 "3ca72728f60db1164a344d6b75a03b16f38281d35e7de1bb85948fec3cafe4e2"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.10/zedg-zh-cn-macos-x86_64-v0.233.10.dmg"
    sha256 "943d45da8b1042ebd081c7f6a7d97a095aa06e46418f02a9eda803b38a8fcd27"
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
