cask "zedg-preview" do
  version "1.3.4-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.4-pre/zedg-zh-cn-macos-aarch64-v1.3.4-pre.dmg"
    sha256 "881e3ea14a01407ed201f76e9cb0ab069c2afecdd24a2ad819384cd81b95ff66"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.4-pre/zedg-zh-cn-macos-x86_64-v1.3.4-pre.dmg"
    sha256 "79367bd0476450f1feaecaf491c8c94f4fff0d64636ecd6a7cb3c9ebd6aa1f78"
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
