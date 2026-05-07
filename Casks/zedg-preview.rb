cask "zedg-preview" do
  version "1.2.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.1-pre/zedg-zh-cn-macos-aarch64-v1.2.1-pre.dmg"
    sha256 "bc51f71251d84d72e31cb8f67214d9dd9c67437952a54db9e3a72a6d2bbdd4b7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.1-pre/zedg-zh-cn-macos-x86_64-v1.2.1-pre.dmg"
    sha256 "0da69ae2cffc3adfd3ab7544bb91f6e8873fda4ce381f6f6a446da000f8ed09a"
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
