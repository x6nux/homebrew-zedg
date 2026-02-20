cask "zedg-preview" do
  version "0.225.3-pre"
  sha256 "66d251548feabe95afff6d5216494a61d9e4db23298f7701dfa2307ca6c9160f"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.3-pre/zedg-zh-cn-macos-aarch64-v0.225.3-pre.dmg"
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
