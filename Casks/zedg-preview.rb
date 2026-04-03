cask "zedg-preview" do
  version "0.231.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.1-pre/zedg-zh-cn-macos-aarch64-v0.231.1-pre.dmg"
    sha256 "d73d06e541589c5eb538029d6059b87c5f1328f32bd36c5a803ae943f5a94f2e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.1-pre/zedg-zh-cn-macos-x86_64-v0.231.1-pre.dmg"
    sha256 "ef4ac4a1cf2b4623731c0500b587f4629b88c2c3545e6f1df01a7ce2c18fd53f"
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
