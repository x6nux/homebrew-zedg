cask "zedg" do
  version "1.22.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.22.0/zedg-zh-cn-macos-aarch64-v1.22.0.dmg"
    sha256 "c09cd76475eb7f56f937d42df5a18691fb018521cf8b35fb9bde11e769b2aca5"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.22.0/zedg-zh-cn-macos-x86_64-v1.22.0.dmg"
    sha256 "94ebb9fc85fc7520fcf32d62792bda4234e2fc6e9ee72bd2340275614fec6048"
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
