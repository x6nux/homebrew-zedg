cask "zedg-preview" do
  version "0.234.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.3-pre/zedg-zh-cn-macos-aarch64-v0.234.3-pre.dmg"
    sha256 "7e8e20e46ad9eafe7dcaf30b77fb546656e0d6ae4d4136052646d3b069c4dc51"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.234.3-pre/zedg-zh-cn-macos-x86_64-v0.234.3-pre.dmg"
    sha256 "a7cccc988e158e08aeaeb0497835f1eace3997be96b0e478b214805b27d8d3b9"
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
