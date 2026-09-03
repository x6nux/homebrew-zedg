cask "zedg-preview" do
  version "1.19.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.0-pre/zedg-zh-cn-macos-aarch64-v1.19.0-pre.dmg"
    sha256 "5265e2ae35bf0d0e09fca755db439fba8f30355a057905edf69318b4b4e3d756"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.0-pre/zedg-zh-cn-macos-x86_64-v1.19.0-pre.dmg"
    sha256 "cd187be3c02a81d11158d29c6695bbf7012c4085fd8717dc5c4630a759a86bf6"
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
