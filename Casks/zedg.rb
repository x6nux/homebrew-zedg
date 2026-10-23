cask "zedg" do
  version "1.25.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.3/zedg-zh-cn-macos-aarch64-v1.25.3.dmg"
    sha256 "c6c63774f262f1a87c91f11003266d613fbaba0d759b69356b8c9e4dfd28f78e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.3/zedg-zh-cn-macos-x86_64-v1.25.3.dmg"
    sha256 "ecfcd54069775feca371504d7422da4e4e57e40b209bd4cbce5721e8892a8123"
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
