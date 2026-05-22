cask "zedg-preview" do
  version "1.4.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.1-pre/zedg-zh-cn-macos-aarch64-v1.4.1-pre.dmg"
    sha256 "1161521c1a9c23bd5504ef80642bf1fc609a626555a7de80d0fac5dfae0a26e6"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.1-pre/zedg-zh-cn-macos-x86_64-v1.4.1-pre.dmg"
    sha256 "3cb0f2dbec5cec5f7caa102721cbc2cfcf1df5bfa537b2fdb00466b47808c8d6"
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
