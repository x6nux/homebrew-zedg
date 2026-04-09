cask "zedg-preview" do
  version "0.232.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.0-pre/zedg-zh-cn-macos-aarch64-v0.232.0-pre.dmg"
    sha256 "9603f807a53ff34c0c4b407cce82d2001c2b08c8b49ff40ababbdf41e18bbbd1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.0-pre/zedg-zh-cn-macos-x86_64-v0.232.0-pre.dmg"
    sha256 "49ea61c3e5a1e4e27a096a45c87b4e1b674cf8ca05b9c47071bef61b58eddf34"
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
