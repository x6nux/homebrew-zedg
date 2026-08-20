cask "zedg" do
  version "1.16.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.1/zedg-zh-cn-macos-aarch64-v1.16.1.dmg"
    sha256 "8ff69c02178a3bc8b2954e04973f3318ebe8a46c670e0ebf51ae5092b8ce4d2f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.1/zedg-zh-cn-macos-x86_64-v1.16.1.dmg"
    sha256 "288f2769d323507df90747409e4767d800a145a6a8bf05ecf69e4c2d02311d3e"
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
