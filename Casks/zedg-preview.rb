cask "zedg-preview" do
  version "0.233.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.0-pre/zedg-zh-cn-macos-aarch64-v0.233.0-pre.dmg"
    sha256 "e40c57176901fd8d93c348862701179a7d7059363c440eecbd4d1ae66a1784a1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.0-pre/zedg-zh-cn-macos-x86_64-v0.233.0-pre.dmg"
    sha256 "99bc4d50a6a96b71e8b7f2d606ba9b7115adbb8322c1093a9c47de3606627d33"
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
