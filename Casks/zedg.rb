cask "zedg" do
  version "1.3.7"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.7/zedg-zh-cn-macos-aarch64-v1.3.7.dmg"
    sha256 "10c7046c0bf696e6fdb855fcf912813045cec9551fde5e108b8cbb06d46b4a17"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.7/zedg-zh-cn-macos-x86_64-v1.3.7.dmg"
    sha256 "8b90a6808d57b2a090f42a1ee20d1f67840145b777718027cb5596cd4ac611ab"
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
