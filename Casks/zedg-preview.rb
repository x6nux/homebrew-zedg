cask "zedg-preview" do
  version "1.20.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.2/zedg-zh-cn-macos-aarch64-v1.20.2.dmg"
    sha256 "415e08d4cddde86c507ba04074d29c903168a00def9cfee28b0fb6db61e13f7b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.2/zedg-zh-cn-macos-x86_64-v1.20.2.dmg"
    sha256 "2d970a791ade2c5679432487b8ab88b1784e98ba703a201ffbf357bb5f61083d"
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
