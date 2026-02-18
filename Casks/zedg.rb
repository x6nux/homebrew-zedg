cask "zedg" do
  version "0.224.4-pre"
  sha256 "0b9965cded8e3bb269bd29b9e49221791a31073890faf33e6e9667e8db563d5d"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.4-pre/zedg-zh-cn-macos-aarch64-v0.224.4-pre.dmg"
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
