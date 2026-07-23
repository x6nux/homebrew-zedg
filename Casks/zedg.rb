cask "zedg" do
  version "1.12.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.0/zedg-zh-cn-macos-aarch64-v1.12.0.dmg"
    sha256 "d85dabc0552316ac9226f1e921c1246fb2b056d727c825e3113c4c3505c938e8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.0/zedg-zh-cn-macos-x86_64-v1.12.0.dmg"
    sha256 "2184501e956110d2a927241f6b596ffa89caeba84ca6b808c1a64ed239468626"
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
