cask "zedg" do
  version "1.2.6"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.6/zedg-zh-cn-macos-aarch64-v1.2.6.dmg"
    sha256 "69022b603d045602e62b47e882da9707fe629e8ca6cd51b60220bab21f7c56d8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.6/zedg-zh-cn-macos-x86_64-v1.2.6.dmg"
    sha256 "151514de3a21633ed85b7a14bcc4db92e99772c36167796bc711506d586ae307"
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
