cask "zedg" do
  version "1.3.6"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.6/zedg-zh-cn-macos-aarch64-v1.3.6.dmg"
    sha256 "16f6f92f09a68b89d5e1716e0c36e1f4744705a0b563f0486cf8dd5a111c5598"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.6/zedg-zh-cn-macos-x86_64-v1.3.6.dmg"
    sha256 "1a93fcb989454a917e5f12f3f8acf17323e2d54347e83c950958f1c653e6da4e"
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
