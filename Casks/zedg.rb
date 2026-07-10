cask "zedg" do
  version "1.10.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.2/zedg-zh-cn-macos-aarch64-v1.10.2.dmg"
    sha256 "797a0361fdb3acbb658af9738311dcd0adc4bffe01aae34825f6ea627b5a56c7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.2/zedg-zh-cn-macos-x86_64-v1.10.2.dmg"
    sha256 "bb3b06f41080c8845b20baf0a37417ad25b3fbea3d0209ba01abd4212bfbf0bd"
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
