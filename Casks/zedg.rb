cask "zedg" do
  version "0.225.10"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.10/zedg-zh-cn-macos-aarch64-v0.225.10.dmg"
    sha256 "e2b7b3a2c95e59e87af5eeefc226b69eb11338ff64dc45dc348cf04327a248e4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.10/zedg-zh-cn-macos-x86_64-v0.225.10.dmg"
    sha256 "2ce8ab0113ad5c41cd0c3e5f4fc4dfc7c6df792fbeb9ef76be14367fe91c5bec"
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
