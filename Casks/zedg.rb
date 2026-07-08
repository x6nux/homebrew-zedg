cask "zedg" do
  version "1.10.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.0/zedg-zh-cn-macos-aarch64-v1.10.0.dmg"
    sha256 "7efe2af7760c0862b4fe131a45ba0d9d2856c33bdd6d2fa27c58cc0778b1ab2b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.0/zedg-zh-cn-macos-x86_64-v1.10.0.dmg"
    sha256 "6bda6ea0775ca2bfe3765982ee116aacad95f0ae687a071259bb79abeae1577c"
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
