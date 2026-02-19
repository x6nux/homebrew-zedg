cask "zedg" do
  version "0.224.6"
  sha256 "cc31fac3d7d99b213c067534232c364f6cd3090eb852d0fb3a5a1cc8a6354ed2"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.6/zedg-zh-cn-macos-aarch64-v0.224.6.dmg"
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
