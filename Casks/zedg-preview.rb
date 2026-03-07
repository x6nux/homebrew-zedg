cask "zedg-preview" do
  version "0.227.1-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1-pre.1/zedg-zh-cn-macos-aarch64-v0.227.1-pre.dmg"
    sha256 "0e8fae3eb8ad85a08e2ada8ebc537a0c73ae35e1941a8665649ebbea602a751d"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.227.1-pre.1/zedg-zh-cn-macos-x86_64-v0.227.1-pre.dmg"
    sha256 "b2a86cde18ad4f2a3ca216e1ac173b31c1d4cc2295ad67ca7b5c5590b9734d63"
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
