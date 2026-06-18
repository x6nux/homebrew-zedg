cask "zedg-preview" do
  version "1.8.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.0-pre/zedg-zh-cn-macos-aarch64-v1.8.0-pre.dmg"
    sha256 "d2ae47a35190ce26c5834b6b6d29b732d97fc2954da2cf60fccdf1ef28d5e6a8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.0-pre/zedg-zh-cn-macos-x86_64-v1.8.0-pre.dmg"
    sha256 "d298cdfcc3bf41f5e37176b167a681e9ef0dd8cd28aa217f4f27463163b8acff"
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
