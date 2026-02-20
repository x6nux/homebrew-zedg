cask "zedg" do
  version "0.225.2-pre"
  sha256 "a4c1f11e536eb65552a938d38e2ad087a7df5ced4f6aea113728a89b245422a1"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.2-pre/zedg-zh-cn-macos-aarch64-v0.225.2-pre.dmg"
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
