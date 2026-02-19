cask "zedg" do
  version "0.225.0-pre"
  sha256 "5d9a7700a4c3107a344c30719e4bd14a6b9761107ff507b5f5cf737e572f14ed"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.0-pre/zedg-zh-cn-macos-aarch64-v0.225.0-pre.dmg"
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
