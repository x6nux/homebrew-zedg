cask "zedg-preview" do
  version "1.1.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.2-pre/zedg-zh-cn-macos-aarch64-v1.1.2-pre.dmg"
    sha256 "92d5f26208f84f721927fddeed38a0697ca38825f9a46a33237aba8cbe76a129"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.2-pre/zedg-zh-cn-macos-x86_64-v1.1.2-pre.dmg"
    sha256 "59fa8e51713ab2cf075f09ab8a6dd7a19b2c4da1bae2eeb9ec97bffa7685d0da"
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
