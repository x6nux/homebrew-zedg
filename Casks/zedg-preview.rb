cask "zedg-preview" do
  version "1.17.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.0-pre/zedg-zh-cn-macos-aarch64-v1.17.0-pre.dmg"
    sha256 "e3aea1172f30545f4f1d98577b2b7feba4dfdf52abbb4e9e4c7fcc156940590c"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.0-pre/zedg-zh-cn-macos-x86_64-v1.17.0-pre.dmg"
    sha256 "a5121740c482cdc8647bec0a12743d7b3fc3b8dd3ec03d9063a91a9e6eafbab0"
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
