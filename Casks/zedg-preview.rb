cask "zedg-preview" do
  version "1.2.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.2-pre/zedg-zh-cn-macos-aarch64-v1.2.2-pre.dmg"
    sha256 "70ef30291b851ed4175887befc173e24fc66c7ebbf48c020fb838b853df04d96"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.2-pre/zedg-zh-cn-macos-x86_64-v1.2.2-pre.dmg"
    sha256 "ef1e729c965a644590aee7aee6353a942a0f1874786652eb73a11cf8a1e41467"
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
