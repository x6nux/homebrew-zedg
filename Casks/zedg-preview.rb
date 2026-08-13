cask "zedg-preview" do
  version "1.16.0-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.0-pre.1/zedg-zh-cn-macos-aarch64-v1.16.0-pre.dmg"
    sha256 "61192f1ebd3de76e8e3abe2e8aa3f52a2e3b1f71ed1c7da6c3b0b74e1d34966a"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.0-pre.1/zedg-zh-cn-macos-x86_64-v1.16.0-pre.dmg"
    sha256 "fab4521bb1daff92c154e5dbbe07a48b58edff6cc79d8ec4a8020b35cc9ff652"
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
