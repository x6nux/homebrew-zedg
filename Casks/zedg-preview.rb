cask "zedg-preview" do
  version "0.230.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.0-pre/zedg-zh-cn-macos-aarch64-v0.230.0-pre.dmg"
    sha256 "856df8661c4d3c2381b6ab9ff1203e863ee50e691399c12f28af08fefedf8b7a"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.0-pre/zedg-zh-cn-macos-x86_64-v0.230.0-pre.dmg"
    sha256 "a865dddf9c2887dde94ff261c8f5c0ec3e47038986a95f60465feb6165e2c845"
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
