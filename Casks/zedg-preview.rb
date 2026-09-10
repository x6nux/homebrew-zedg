cask "zedg-preview" do
  version "1.20.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.0-pre/zedg-zh-cn-macos-aarch64-v1.20.0-pre.dmg"
    sha256 "c63722652e87d8b12ecca262f407b9a5172873cacca0afe9f6abc516575fe5e4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.0-pre/zedg-zh-cn-macos-x86_64-v1.20.0-pre.dmg"
    sha256 "55dfcd9a93bafbac13f575a9f834ddd4efa1ed65d0ac103e3ede4a8c4bc26390"
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
