cask "zedg" do
  version "0.225.1-pre"
  sha256 "c88a88ce2d7093b2114e6a671b09cd3dfda9a4766c6b2ec318dac70edbcf42f8"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.1-pre/zedg-zh-cn-macos-aarch64-v0.225.1-pre.dmg"
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
