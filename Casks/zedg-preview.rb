cask "zedg-preview" do
  version "1.13.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.0-pre/zedg-zh-cn-macos-aarch64-v1.13.0-pre.dmg"
    sha256 "5595adb7b30ec21a4b95596d5f36a44cb9bbfe8427b7800c339be9f842c38d7b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.0-pre/zedg-zh-cn-macos-x86_64-v1.13.0-pre.dmg"
    sha256 "9839574f9182e24632453a23cfd6c051c0a45701f69bb0e6d0b89dbc7a5811e3"
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
