cask "zedg-preview" do
  version "1.20.0-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.0-pre.1/zedg-zh-cn-macos-aarch64-v1.20.0-pre.dmg"
    sha256 "f6b042642f52983c93a67a8706ff7c2f0e77f90f346100626d69728839e931e2"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.20.0-pre.1/zedg-zh-cn-macos-x86_64-v1.20.0-pre.dmg"
    sha256 "c6b870a7cf53c69b96f9808cd5d822b21dd88616498c5d7c10f0d174506d619f"
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
