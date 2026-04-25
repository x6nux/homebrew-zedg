cask "zedg-preview" do
  version "0.234.6-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.6-pre/zedg-zh-cn-macos-aarch64-v0.234.6-pre.dmg"
    sha256 "8904b7170221c029a51dede72cd867f0b68b40bae4bc9e349b30abd738df330e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.6-pre/zedg-zh-cn-macos-x86_64-v0.234.6-pre.dmg"
    sha256 "a505a93878ba2c3ce9f7df1b7dd86a1df76e92c2560680ddd758c31b8197ae43"
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
