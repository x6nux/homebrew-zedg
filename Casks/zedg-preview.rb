cask "zedg-preview" do
  version "1.9.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.9.0-pre/zedg-zh-cn-macos-aarch64-v1.9.0-pre.dmg"
    sha256 "fd65d43836d32ec97f2d3d005917c9175b24d0d71281352c7ce59abafea21bb8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.9.0-pre/zedg-zh-cn-macos-x86_64-v1.9.0-pre.dmg"
    sha256 "1928a22503a7d450150ff892482f3f71d8830342dc71dd742a1dfea25ec9ec6d"
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
