cask "zedg" do
  version "1.17.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.2/zedg-zh-cn-macos-aarch64-v1.17.2.dmg"
    sha256 "707a0e9981b9cea4db022e821fa2378d3a7f6aa02e08b9207b4522f30def3dda"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.2/zedg-zh-cn-macos-x86_64-v1.17.2.dmg"
    sha256 "36939f1eca1f26187790be4a7cb45f2e6256d25c122a2c2e5ad3f45700c92e55"
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
