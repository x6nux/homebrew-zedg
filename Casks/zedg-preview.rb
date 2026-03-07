cask "zedg-preview" do
  version "0.227.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1-pre/zedg-zh-cn-macos-aarch64-v0.227.1-pre.dmg"
    sha256 "c6158866c5352839046f1d93041390289c8e6b177ee0cbac9e753533d93e290e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1-pre/zedg-zh-cn-macos-x86_64-v0.227.1-pre.dmg"
    sha256 "45419948f7538b39e3c7fa1329373843bd4fb6230a8eb3df2e3b99477515ff18"
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
