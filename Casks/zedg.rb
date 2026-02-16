cask "zedg" do
  version "0.224.2-pre"
  sha256 "ccf94132b942dd0fec2de5d36bf4ca10054bb52b82425a6567f673af65d973c3"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.224.2-pre/zedg-zh-cn-macos-aarch64-v0.224.2-pre.dmg"
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
