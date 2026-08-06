cask "zedg-preview" do
  version "1.15.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.0-pre/zedg-zh-cn-macos-aarch64-v1.15.0-pre.dmg"
    sha256 "fadeb8119f16ca452d8bcbb73bcadfc6078cad745b79f47a3726e9fd7181a221"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.0-pre/zedg-zh-cn-macos-x86_64-v1.15.0-pre.dmg"
    sha256 "a602a7e2795958ddcddebaf07ae3525619be18b338c346aff9147e0270e147a9"
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
