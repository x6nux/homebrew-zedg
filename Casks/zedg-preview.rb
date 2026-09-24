cask "zedg-preview" do
  version "1.22.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.22.0-pre/zedg-zh-cn-macos-aarch64-v1.22.0-pre.dmg"
    sha256 "3f6742fdfa6dc400bac3e9d322482d72f1f91785f1c1468b7381a4a38b86a8fd"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.22.0-pre/zedg-zh-cn-macos-x86_64-v1.22.0-pre.dmg"
    sha256 "31c6b03f786a3db082b0cdb08e6e19ec97cd2444f97cf378bf1643fbe3d031dc"
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
