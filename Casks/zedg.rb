cask "zedg" do
  version "0.229.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.229.0/zedg-zh-cn-macos-aarch64-v0.229.0.dmg"
    sha256 "5439ebbe20b1f39e6dcad2919f346613506bcda4b9dbec5ad9c4c6581482d8e1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.229.0/zedg-zh-cn-macos-x86_64-v0.229.0.dmg"
    sha256 "984b4f5745b9c024b1ade5da2703a1d8dfe8664e4e1557464c896970ebec8ae4"
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
