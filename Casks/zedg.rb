cask "zedg" do
  version "1.8.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.2/zedg-zh-cn-macos-aarch64-v1.8.2.dmg"
    sha256 "db4194054771e347da2ca85286e85abc4a98afd869c79a3007eb178e602f9fb1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.8.2/zedg-zh-cn-macos-x86_64-v1.8.2.dmg"
    sha256 "6713c5791b7dd2ab2b5e8f66c201a256b227e591e034422034acffa87bc17fce"
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
