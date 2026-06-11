cask "zedg-preview" do
  version "1.7.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.1-pre/zedg-zh-cn-macos-aarch64-v1.7.1-pre.dmg"
    sha256 "5f8f5d1620bf542ce4c38aa69c5ee56f2880e70dcaf51de7533c3a335821c3c4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.7.1-pre/zedg-zh-cn-macos-x86_64-v1.7.1-pre.dmg"
    sha256 "947e75e09a9a1e282118583974c3801fea26c19efb79e507fafb3593f80817f0"
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
