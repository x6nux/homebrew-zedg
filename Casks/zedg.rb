cask "zedg" do
  version "1.1.5"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.5/zedg-zh-cn-macos-aarch64-v1.1.5.dmg"
    sha256 "27ba5540c5654fef79bab81c5bb2163b06671b88c9d8ed8391e380b4aaecb766"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.5/zedg-zh-cn-macos-x86_64-v1.1.5.dmg"
    sha256 "bb93efcd8adee8e09ae1fe8c0622d0cabedf8853f7db77619a0871974a971204"
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
