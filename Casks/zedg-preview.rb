cask "zedg-preview" do
  version "1.6.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.0-pre/zedg-zh-cn-macos-aarch64-v1.6.0-pre.dmg"
    sha256 "25a5443ee1d03061cd0aeae8d15a8e85dd518c29f0a1bcf4ccd2080c13f5288e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.0-pre/zedg-zh-cn-macos-x86_64-v1.6.0-pre.dmg"
    sha256 "b5fa28a8711303fc1c5c6f6705dbf6677bd7799592ecf15e30068f0f279baf00"
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
