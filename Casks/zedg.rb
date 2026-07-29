cask "zedg" do
  version "1.13.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.1/zedg-zh-cn-macos-aarch64-v1.13.1.dmg"
    sha256 "1aac0acb185a15daaad89c1a7725392b1f58c8ccae660ab907acda0d3658668b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.1/zedg-zh-cn-macos-x86_64-v1.13.1.dmg"
    sha256 "85ce28219cf3a62460f4023cb4f3b138508c9fe642140ecb8d6f589ac4f8531c"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
