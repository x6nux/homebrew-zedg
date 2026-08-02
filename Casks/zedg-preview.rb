cask "zedg-preview" do
  version "1.14.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.2-pre/zedg-zh-cn-macos-aarch64-v1.14.2-pre.dmg"
    sha256 "8cfe25635dc6699c9822c865d3cbca9ed3d37912fb2b78d3c36d1be13b3bd4c8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.2-pre/zedg-zh-cn-macos-x86_64-v1.14.2-pre.dmg"
    sha256 "5a9453cc7d2e647c9ab79f94de8e87d4c1cfce99fe3864f683ea97dc4d210929"
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
