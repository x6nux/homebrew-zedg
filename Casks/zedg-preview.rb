cask "zedg-preview" do
  version "0.225.9-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.9-pre/zedg-zh-cn-macos-aarch64-v0.225.9-pre.dmg"
    sha256 "99bf24df08d3b37125d0663d5e687bba40583a7a069aaacbcd4309377a6d02fa"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.9-pre/zedg-zh-cn-macos-x86_64-v0.225.9-pre.dmg"
    sha256 "9df5a130af9606d2fcd8085f1dd15461e775f5524ac218ae8742a829460dfe7d"
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
