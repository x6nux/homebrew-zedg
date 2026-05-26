cask "zedg-preview" do
  version "1.4.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.2-pre/zedg-zh-cn-macos-aarch64-v1.4.2-pre.dmg"
    sha256 "c7eac88be2e15d2b85d79675335a4eaa2908775e9535b4ff4ecb5f69b343e000"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.2-pre/zedg-zh-cn-macos-x86_64-v1.4.2-pre.dmg"
    sha256 "9dc330a1647f7313e6a8124d3ef62f94b8f028d1e1f9601b17294fcc97ce347b"
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
