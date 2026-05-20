cask "zedg" do
  version "1.3.5"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.5/zedg-zh-cn-macos-aarch64-v1.3.5.dmg"
    sha256 "aa94ecf20d4f6fced70916ae740fb5847a0ddf03c245a1297e1e14d4a7234e74"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.5/zedg-zh-cn-macos-x86_64-v1.3.5.dmg"
    sha256 "747b4dc0760661972e1c134f2ee69f36297b5357c69fda02c174f54680a1c1be"
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
