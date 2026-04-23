cask "zedg-preview" do
  version "0.234.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.2-pre/zedg-zh-cn-macos-aarch64-v0.234.2-pre.dmg"
    sha256 "01c439958f2d027c3216477edbe1687c47be9785c53032ac4dbdc478b88aec92"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.2-pre/zedg-zh-cn-macos-x86_64-v0.234.2-pre.dmg"
    sha256 "fcde82b9557d80060f8bc3c533a15dca1052d37bdd06f787d428833000ae4566"
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
