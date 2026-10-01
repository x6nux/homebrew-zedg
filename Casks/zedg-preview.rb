cask "zedg-preview" do
  version "1.23.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.1-pre/zedg-zh-cn-macos-aarch64-v1.23.1-pre.dmg"
    sha256 "4c978753b1c4ee6ae3b03cec0e55104b096d91bf3a9e025bf4d94322e3317946"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.1-pre/zedg-zh-cn-macos-x86_64-v1.23.1-pre.dmg"
    sha256 "c15252e0d44448b1692079ff3be8b5cda28d6396d2e99d411464bfd2bf68d34d"
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
