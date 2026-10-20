cask "zedg" do
  version "1.24.4"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.4/zedg-zh-cn-macos-aarch64-v1.24.4.dmg"
    sha256 "6680b777e08c383393f4e81f91380225e85a6f70aa6cd38739a5491b2cca3220"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.4/zedg-zh-cn-macos-x86_64-v1.24.4.dmg"
    sha256 "e139a8c73efb5351c0bf7d10b65e8db7e30707a9f7cd1be1fcff46903d2f5183"
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
