cask "zedg-preview" do
  version "0.225.7-pre"
  sha256 "c0fbddb6bbe649e5ee49ddea50dbe86be714bdd81786d4bf18245ff4dd60a9c6"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.7-pre/zedg-zh-cn-macos-universal-v0.225.7-pre.dmg"
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
