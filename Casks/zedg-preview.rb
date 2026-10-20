cask "zedg-preview" do
  version "1.25.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.1-pre/zedg-zh-cn-macos-aarch64-v1.25.1-pre.dmg"
    sha256 "53f160b14912a4dc675089fa46cccce53ba385c24fc1800ab686b83a3dcf36dd"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.25.1-pre/zedg-zh-cn-macos-x86_64-v1.25.1-pre.dmg"
    sha256 "bbbccc7fd0fc849c76ece57f6fd982c4fc2d5297423050c35cb1bc8fe6df0967"
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
