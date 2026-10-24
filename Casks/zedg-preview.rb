cask "zedg-preview" do
  version "1.26.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.26.2-pre/zedg-zh-cn-macos-aarch64-v1.26.2-pre.dmg"
    sha256 "45dcfe04aa6cfee5151d2168a888a1de526354bbc74ca5634505c1542f68ab8b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.26.2-pre/zedg-zh-cn-macos-x86_64-v1.26.2-pre.dmg"
    sha256 "fca00f505f14501cd198fd3ef5def1172ddfb7346ea1c2e14585601315ba6fbd"
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
