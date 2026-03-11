cask "zedg" do
  version "0.227.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1/zedg-zh-cn-macos-aarch64-v0.227.1.dmg"
    sha256 "4d61a8a6edd2741e705caab153a2a7e6b4918f207b221bb60b0d5a75b2468285"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1/zedg-zh-cn-macos-x86_64-v0.227.1.dmg"
    sha256 "a86f99639dba10e943818d97e7a376e9679a074c919ebb661b6757fe1a28d565"
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
