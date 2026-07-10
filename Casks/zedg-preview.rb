cask "zedg-preview" do
  version "1.11.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.1-pre/zedg-zh-cn-macos-aarch64-v1.11.1-pre.dmg"
    sha256 "a7fd69f55262c012aacdbc0c447e6d7f5226975dd38e524f6f165897d3cf3834"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.1-pre/zedg-zh-cn-macos-x86_64-v1.11.1-pre.dmg"
    sha256 "0039965cdc1fd24310c48f320dcd3904c42feff2cd7f1c34844837497cc6ddcd"
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
