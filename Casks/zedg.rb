cask "zedg" do
  version "0.224.1-pre"
  sha256 "18372b9f1e5495ceb1ca0fbc21388aaba9ffa292cdf2072eb67bc3a727724225"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.1-pre/zedg-zh-cn-macos-aarch64-v0.224.1-pre.dmg"
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
