cask "zedg-preview" do
  version "1.11.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.2-pre/zedg-zh-cn-macos-aarch64-v1.11.2-pre.dmg"
    sha256 "0513cc3ee4ed51ad20a5785ae9c538da924bc2e2cdcf77c57e62f1c26e804bb4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.2-pre/zedg-zh-cn-macos-x86_64-v1.11.2-pre.dmg"
    sha256 "7e3718c362a2acb9471436461377bf55abfef68d18b3952efc7cf4d2acd2a5f3"
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
