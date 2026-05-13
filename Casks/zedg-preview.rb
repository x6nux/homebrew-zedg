cask "zedg-preview" do
  version "1.2.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.3-pre/zedg-zh-cn-macos-aarch64-v1.2.3-pre.dmg"
    sha256 "1da3ce6a9be0c7979616ae5b712a55544862b38c423d4c6263707af5c65f872d"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.3-pre/zedg-zh-cn-macos-x86_64-v1.2.3-pre.dmg"
    sha256 "4d0d12882d2a18ab6a2ae49cd34097b7e6491bdb0acc7ba3ce9822d36092a500"
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
