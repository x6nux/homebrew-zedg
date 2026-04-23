cask "zedg-preview" do
  version "0.233.7"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.7/zedg-zh-cn-macos-aarch64-v0.233.7.dmg"
    sha256 "bbbc26102b189c40fbbf65521c23af6433981a4ce17df9c43d8ea080b798506c"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.7/zedg-zh-cn-macos-x86_64-v0.233.7.dmg"
    sha256 "221acfd2cc8d5e9850ca20cfc53c12ecd579304b00c1e940d4d67bb43e31b6c8"
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
