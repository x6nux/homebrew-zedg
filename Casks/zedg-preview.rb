cask "zedg-preview" do
  version "1.5.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.0-pre/zedg-zh-cn-macos-aarch64-v1.5.0-pre.dmg"
    sha256 "656d5b27394f45f88a6db47ad039e38eb4e2085d45a0c62320a6302ce6b5e793"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.0-pre/zedg-zh-cn-macos-x86_64-v1.5.0-pre.dmg"
    sha256 "5d185d5302bdb63bffb7548bb3b29b739bf65a1f9523a41a226e71965dbd369a"
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
