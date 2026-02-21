cask "zedg-preview" do
  version "0.225.6-pre"
  sha256 "b860c05f27e9eb77f920416f2b01459cb8e6187772937c5b55fb23a758bf4f07"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.6-pre/zedg-zh-cn-macos-aarch64-v0.225.6-pre.dmg"
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
