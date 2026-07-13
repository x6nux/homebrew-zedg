cask "zedg" do
  version "1.10.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.3/zedg-zh-cn-macos-aarch64-v1.10.3.dmg"
    sha256 "79c9c831d4b5c1c607d0785b1b3e9ff05c4466fc639c004769e71d5d117f2090"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.3/zedg-zh-cn-macos-x86_64-v1.10.3.dmg"
    sha256 "8e67b9ad7d379c31e254791810b437536d545ec4f25fc05a835ef30ddb5df62e"
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
