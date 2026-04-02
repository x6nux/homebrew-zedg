cask "zedg" do
  version "0.230.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.0/zedg-zh-cn-macos-aarch64-v0.230.0.dmg"
    sha256 "9fbae4911a8a5bc57c677a31367e2597b93b0934c0d3deccb9d71f63dabc2916"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.0/zedg-zh-cn-macos-x86_64-v0.230.0.dmg"
    sha256 "77cb53c3f5e193082e645ab95987cf5f87a3f47af6d93dd127d10f5399587892"
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
