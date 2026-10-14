cask "zedg" do
  version "1.24.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.2/zedg-zh-cn-macos-aarch64-v1.24.2.dmg"
    sha256 "f6e28740fb201a2cd416de9c6f817a82383e75fbd43907bb464f73dd93446884"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.2/zedg-zh-cn-macos-x86_64-v1.24.2.dmg"
    sha256 "decf53c1a9036314d718587e65f89caf3b9c38b00ea81a4f012d5850d336809d"
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
