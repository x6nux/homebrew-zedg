cask "zedg" do
  version "1.5.5"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.5/zedg-zh-cn-macos-aarch64-v1.5.5.dmg"
    sha256 "838f44945a1d610c4221cf0d802291f2e6454dd18f1d67930a4980057053a349"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.5/zedg-zh-cn-macos-x86_64-v1.5.5.dmg"
    sha256 "674653b822aaec1fe9804a65fbf3321f457d9dab498b924269070ff900d8ae3e"
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
