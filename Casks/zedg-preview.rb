cask "zedg-preview" do
  version "1.6.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.2-pre/zedg-zh-cn-macos-aarch64-v1.6.2-pre.dmg"
    sha256 "a9384dee593402d30d4258664b8b123547f031c5cb906b9ce5b39176a57a863b"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.2-pre/zedg-zh-cn-macos-x86_64-v1.6.2-pre.dmg"
    sha256 "e1b9f75832c273f4d03d43334d443b262cd0e6eb08ca678223d1b16458ee63b0"
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
