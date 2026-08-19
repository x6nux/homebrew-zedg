cask "zedg-preview" do
  version "1.16.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.1-pre/zedg-zh-cn-macos-aarch64-v1.16.1-pre.dmg"
    sha256 "fd4ca4d305877e51dbda9ce1e12dc1a4fe1bb1d99b229524e093f1de6df594c9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.1-pre/zedg-zh-cn-macos-x86_64-v1.16.1-pre.dmg"
    sha256 "7eaff1c7fd666b3192a6e2047d838ab34198e5685eedd652f010e115d0522151"
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
