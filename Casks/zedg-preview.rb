cask "zedg-preview" do
  version "1.7.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.2-pre/zedg-zh-cn-macos-aarch64-v1.7.2-pre.dmg"
    sha256 "e403336399a635793d01edacce0a723798774e8483fc43daf4f0a09eb08f6b27"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.2-pre/zedg-zh-cn-macos-x86_64-v1.7.2-pre.dmg"
    sha256 "ff659cdad621a2cebf39e87186fdaa36d86c30c497044b97e0b75cfe7ae70c6b"
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
