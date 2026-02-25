cask "zedg-preview" do
  version "0.225.8-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.8-pre/zedg-zh-cn-macos-aarch64-v0.225.8-pre.dmg"
    sha256 "e666413307473834d36a2f858d85aa0ae170364db86b8338ba5aa8dc135486e7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.8-pre/zedg-zh-cn-macos-x86_64-v0.225.8-pre.dmg"
    sha256 "64dc9e4718fbc10f5752bd0f94429666b812eb2d370f76095cb83cc95115dab4"
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
