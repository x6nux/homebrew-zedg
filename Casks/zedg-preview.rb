cask "zedg-preview" do
  version "0.234.5-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.5-pre/zedg-zh-cn-macos-aarch64-v0.234.5-pre.dmg"
    sha256 "1740303a3696464b4763a03a640894f0ee1607d0b66a16ae96d2e248e877aaad"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.5-pre/zedg-zh-cn-macos-x86_64-v0.234.5-pre.dmg"
    sha256 "fef348fb5fa1f6f26fec3754775f1498805eb751ab41aa7568991a126f366548"
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
