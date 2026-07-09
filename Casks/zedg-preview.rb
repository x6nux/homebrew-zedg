cask "zedg-preview" do
  version "1.11.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.0-pre/zedg-zh-cn-macos-aarch64-v1.11.0-pre.dmg"
    sha256 "3f1add8d2b4428b156d9af5422f9d3a3ef03a667ce61b953cfb4401bf3f13cb1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.0-pre/zedg-zh-cn-macos-x86_64-v1.11.0-pre.dmg"
    sha256 "e8c518d7c36725912ca0950ee3fd11656c225e6222c2d939c9dc982a12d37be1"
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
