cask "zedg" do
  version "1.19.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.2/zedg-zh-cn-macos-aarch64-v1.19.2.dmg"
    sha256 "c9a6eefa492cbf6a81f44268816c1d984083e004c7bb7eda96be0c4e9057d6ba"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.2/zedg-zh-cn-macos-x86_64-v1.19.2.dmg"
    sha256 "81c6ee454ad68395ed3404e9ee9f25f9f42d76207a3bb732f53b058dcc37cd15"
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
