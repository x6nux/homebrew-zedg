cask "zedg-preview" do
  version "1.21.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.21.0-pre/zedg-zh-cn-macos-aarch64-v1.21.0-pre.dmg"
    sha256 "32ede0c121b460afeed126b2e9f980bfaf71fd29a87398c04928fa3535b530e7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.21.0-pre/zedg-zh-cn-macos-x86_64-v1.21.0-pre.dmg"
    sha256 "8b9da6c03e6850575d182e69a31e30d11f14aa4730e1a13451eabe3b9268dc46"
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
