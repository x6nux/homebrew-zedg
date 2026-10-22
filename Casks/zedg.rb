cask "zedg" do
  version "1.25.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.2/zedg-zh-cn-macos-aarch64-v1.25.2.dmg"
    sha256 "f1ac38ad491aaaa4a766075f2109afc2d0ec78764b5a427236c666ee8dac9c3d"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.2/zedg-zh-cn-macos-x86_64-v1.25.2.dmg"
    sha256 "261746b3f6c57064b295e5cdbc9f95bc2b78aee292abe267ebffae09764c3dd5"
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
