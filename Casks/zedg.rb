cask "zedg" do
  version "1.1.7"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.7/zedg-zh-cn-macos-aarch64-v1.1.7.dmg"
    sha256 "6c975d15634a39921298e835c11681ed99a573fa42862e3ccb68986512e1929e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.7/zedg-zh-cn-macos-x86_64-v1.1.7.dmg"
    sha256 "c6d0b27e1fe24f187a193294f0945c5d87ec2679e62dd17a8cbcbd91f7bd85aa"
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
