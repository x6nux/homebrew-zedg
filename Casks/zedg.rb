cask "zedg" do
  version "0.232.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.2/zedg-zh-cn-macos-aarch64-v0.232.2.dmg"
    sha256 "f6456276b7b122d697066b23a1c7b4f255aadefbe975faef4a8cf0052d9ac472"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.2/zedg-zh-cn-macos-x86_64-v0.232.2.dmg"
    sha256 "22497b91d39e195b0a1c88f498d0559477e57d14d79637642ea7704cd9fc6f59"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
