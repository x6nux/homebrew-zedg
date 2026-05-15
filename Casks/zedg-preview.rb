cask "zedg-preview" do
  version "1.3.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.2-pre/zedg-zh-cn-macos-aarch64-v1.3.2-pre.dmg"
    sha256 "7e460ba93aa18d49c322fb8a2d7e915b1c61cecb243bac36f05f1104fc772ce2"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.2-pre/zedg-zh-cn-macos-x86_64-v1.3.2-pre.dmg"
    sha256 "b77aea7408d3fc1f53ad1cd300eaee8bfd2e7e17d9c8a10df4fec1f8b65accc0"
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
