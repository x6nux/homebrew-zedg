cask "zedg-preview" do
  version "0.228.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0-pre/zedg-zh-cn-macos-aarch64-v0.228.0-pre.dmg"
    sha256 "baea01a7663ac59a84bc90e04577636c500a72a2b8d3d321de04d23e9398291c"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0-pre/zedg-zh-cn-macos-x86_64-v0.228.0-pre.dmg"
    sha256 "dde6197a2c4ac0fd6deea8d88d7bb0ec88f7d61eef1e01e702f5a91c07ec6872"
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
