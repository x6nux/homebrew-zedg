cask "zedg" do
  version "1.14.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.2/zedg-zh-cn-macos-aarch64-v1.14.2.dmg"
    sha256 "af4fd3b4e80f1e2cbb77c4e31545b9a9f7c2b0f3af9146061a28f2e7dd936f93"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.2/zedg-zh-cn-macos-x86_64-v1.14.2.dmg"
    sha256 "bcc6a18ff5f5263b46251e80d11a5bd2086c1af6d2ecc45516417e44ac599cee"
  end

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
