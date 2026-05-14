cask "zedg-preview" do
  version "1.3.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.0-pre/zedg-zh-cn-macos-aarch64-v1.3.0-pre.dmg"
    sha256 "731b5af0f75fefdae93ccbe7099c84f3ab68b11074841169c8bdac66d7021ba1"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.0-pre/zedg-zh-cn-macos-x86_64-v1.3.0-pre.dmg"
    sha256 "18069d11d765e3f5b68edb7d000797d3a84c87ae206df42b806f990f36521650"
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
