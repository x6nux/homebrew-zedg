cask "zedg-preview" do
  version "0.232.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.2-pre/zedg-zh-cn-macos-aarch64-v0.232.2-pre.dmg"
    sha256 "f16cd2b10b62bccb1d20c779810e85733e58c3ade77f5de8a90885fe45b5ce4f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.2-pre/zedg-zh-cn-macos-x86_64-v0.232.2-pre.dmg"
    sha256 "bb2cf897e6586c8f1c1726d09466305c9c2584a6ede044e0ae71b241ad26fd43"
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
