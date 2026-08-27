cask "zedg-preview" do
  version "1.18.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0-pre/zedg-zh-cn-macos-aarch64-v1.18.0-pre.dmg"
    sha256 "eaa651e301007c9c17dfe0817e93b0a4bab7005a7f649bb93ba3cbc3ee8afe13"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.0-pre/zedg-zh-cn-macos-x86_64-v1.18.0-pre.dmg"
    sha256 "48742d7af165d3c996f8e75eef394ffdae5b401b2dedfb999268349e3370a53d"
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
