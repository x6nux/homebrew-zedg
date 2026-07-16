cask "zedg-preview" do
  version "1.12.0-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.0-pre.1/zedg-zh-cn-macos-aarch64-v1.12.0-pre.dmg"
    sha256 "879d44f7e236c749d21eb01b746360ce990622e5a73a0ab9f9c94b89631477ed"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.0-pre.1/zedg-zh-cn-macos-x86_64-v1.12.0-pre.dmg"
    sha256 "12c2e0bff01ed1838d8073f56b20aa73143e1408ce69312ad015c6de1e62f2f3"
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
