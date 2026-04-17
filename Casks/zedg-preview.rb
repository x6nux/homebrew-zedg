cask "zedg-preview" do
  version "0.233.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.1-pre/zedg-zh-cn-macos-aarch64-v0.233.1-pre.dmg"
    sha256 "1f9a8650b397a2fa242077eb5366b79d7a0ecaa7bb2f07738c5d1b61280f903f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.1-pre/zedg-zh-cn-macos-x86_64-v0.233.1-pre.dmg"
    sha256 "ee774af6a58a3b50cc380976c3f2ba915ab3213bd7a2b2d22f1d44c83761250f"
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
