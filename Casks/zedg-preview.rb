cask "zedg-preview" do
  version "0.234.4-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.4-pre/zedg-zh-cn-macos-aarch64-v0.234.4-pre.dmg"
    sha256 "5e3e495d029333797e883bcd166e2a249d6bced43fef33fea1fbc46ccff85813"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.4-pre/zedg-zh-cn-macos-x86_64-v0.234.4-pre.dmg"
    sha256 "2769f0c93477ca4212f63450c096296971afcec475c26b1535688facd414da4c"
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
