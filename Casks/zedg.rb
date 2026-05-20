cask "zedg" do
  version "1.2.7"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.7/zedg-zh-cn-macos-aarch64-v1.2.7.dmg"
    sha256 "24e4af39c5522ebf8fb480a4a837fed0ad16a562fc11aca6d076d793b9b25e70"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.7/zedg-zh-cn-macos-x86_64-v1.2.7.dmg"
    sha256 "40544eba5044b96d0ffffe198b6506eb3488c680c637d6a79f16b37f5d38b0f3"
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
