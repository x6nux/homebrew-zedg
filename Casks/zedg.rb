cask "zedg" do
  version "0.225.9"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.9/zedg-zh-cn-macos-aarch64-v0.225.9.dmg"
    sha256 "85c23fb1b82c5ccaba3654bf1f1ffb5a9ae778ee6c2b43944b954642c1197f9f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.9/zedg-zh-cn-macos-x86_64-v0.225.9.dmg"
    sha256 "7bb91829e546d1ac602f24187da5f70213a49359df637df3dcc20f81022ed079"
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
