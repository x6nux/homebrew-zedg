cask "zedg-preview" do
  version "0.233.4-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.4-pre/zedg-zh-cn-macos-aarch64-v0.233.4-pre.dmg"
    sha256 "5e0da5a1544159e18d681fb69a151ccba7d767ee69155f97a64b0adfb65f2c68"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.4-pre/zedg-zh-cn-macos-x86_64-v0.233.4-pre.dmg"
    sha256 "b234e4af45f5af4d87dee7c5c23035fa511a5b545af1e5b39a0b1b85616dd7a6"
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
