cask "zedg-preview" do
  version "1.26.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.26.1-pre/zedg-zh-cn-macos-aarch64-v1.26.1-pre.dmg"
    sha256 "03516543d44b3e2b0382e221d85394549982074f0a32bbd1634245019a84159a"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.26.1-pre/zedg-zh-cn-macos-x86_64-v1.26.1-pre.dmg"
    sha256 "9d306b8b2a30d6cdb0d53f4753c7ea4f09861da9b90ddea7fc99a6211bae9ede"
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
