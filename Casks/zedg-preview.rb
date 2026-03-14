cask "zedg-preview" do
  version "0.228.0-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0-pre.1/zedg-zh-cn-macos-aarch64-v0.228.0-pre.dmg"
    sha256 "2ca77f11289bdc5d74e63a7d3c9696df18ed0ae59f62a2a793970dc23f36d902"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0-pre.1/zedg-zh-cn-macos-x86_64-v0.228.0-pre.dmg"
    sha256 "5ce3cfcd3e8e73f9500139ec4a93401b5ab24f1925edb7292f9984f961ed3594"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
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
