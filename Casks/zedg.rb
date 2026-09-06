cask "zedg" do
  version "1.18.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.1/zedg-zh-cn-macos-aarch64-v1.18.1.dmg"
    sha256 "1e62871a7abfc08dd0b568391b007a3e5442a10205ae4650fb4a92bdfc699021"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.1/zedg-zh-cn-macos-x86_64-v1.18.1.dmg"
    sha256 "eab298fc828778c1a881a8c8a34ef4e1889b0fe7099afbdc26a355c464965fde"
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
