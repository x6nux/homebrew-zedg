cask "zedg-preview" do
  version "0.226.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.2-pre/zedg-zh-cn-macos-aarch64-v0.226.2-pre.dmg"
    sha256 "850f99d8c13fc1f263575ad8e220b3ec45ebdeb0d6ea9638e224aea6b0e1f63e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.2-pre/zedg-zh-cn-macos-x86_64-v0.226.2-pre.dmg"
    sha256 "28730ffd94f9274a8ef690359ed7f87e1e4e26ce8b90fe1c352b1dea7e885c81"
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
