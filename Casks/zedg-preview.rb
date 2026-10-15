cask "zedg-preview" do
  version "1.25.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.0-pre/zedg-zh-cn-macos-aarch64-v1.25.0-pre.dmg"
    sha256 "d794c35ef25cd49888c1730de58a64ef6ece0d362bd8fa97fe16b1c1504dcd26"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.0-pre/zedg-zh-cn-macos-x86_64-v1.25.0-pre.dmg"
    sha256 "20b91b27e1a0980b749286d5d24da6a662fdb0944da77ed439baff48dd380b39"
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
