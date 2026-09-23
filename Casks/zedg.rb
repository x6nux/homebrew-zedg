cask "zedg" do
  version "1.21.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.21.0/zedg-zh-cn-macos-aarch64-v1.21.0.dmg"
    sha256 "3a8a2802f6d6a2061ba081d1caa2fe684449280379c64de4394eaef479056a44"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.21.0/zedg-zh-cn-macos-x86_64-v1.21.0.dmg"
    sha256 "0695f57a0260256122dfc65724f664bb8608e6371aa8edb4739ce085f7ffd859"
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
