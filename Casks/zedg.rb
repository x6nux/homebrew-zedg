cask "zedg" do
  version "1.1.6"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.6/zedg-zh-cn-macos-aarch64-v1.1.6.dmg"
    sha256 "66f163f8779070bf6c04c2eb4164d3962a0605f5e60a46831c4d72cbca53164e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.6/zedg-zh-cn-macos-x86_64-v1.1.6.dmg"
    sha256 "d1451f25f926e2d80b494d55e03cae114261672d26958f04bd3495268f99836d"
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
