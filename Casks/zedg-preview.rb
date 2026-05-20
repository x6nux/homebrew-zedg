cask "zedg-preview" do
  version "1.4.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.0-pre/zedg-zh-cn-macos-aarch64-v1.4.0-pre.dmg"
    sha256 "4f63b413900ca920f398ceb863cbc66230ba1533abcdc089f9e49a3b6ca831e0"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.0-pre/zedg-zh-cn-macos-x86_64-v1.4.0-pre.dmg"
    sha256 "cc6d4eaa03e0c9abab9611d8a47ac585027ce36ba54ac66caaafadc6d71aa24a"
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
