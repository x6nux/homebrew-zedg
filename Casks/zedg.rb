cask "zedg" do
  version "0.224.3-pre"
  sha256 "8c56738cfe7d790868a6684ac66459fdd17e91d215a48058aec63d28f645a83e"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.3-pre/zedg-zh-cn-macos-aarch64-v0.224.3-pre.dmg"
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
