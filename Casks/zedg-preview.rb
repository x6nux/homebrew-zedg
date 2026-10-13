cask "zedg-preview" do
  version "1.24.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.2-pre/zedg-zh-cn-macos-aarch64-v1.24.2-pre.dmg"
    sha256 "7ddde9a329fa8f0a5d59c42dff3278f4d16b47c98de8563489117bc12a2e63b3"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.2-pre/zedg-zh-cn-macos-x86_64-v1.24.2-pre.dmg"
    sha256 "1dde5dce436d7ab1b12ee5d74cd263bec15c1f94392b1d57fa792afd28ee6c0c"
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
