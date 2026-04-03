cask "zedg" do
  version "0.230.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.1/zedg-zh-cn-macos-aarch64-v0.230.1.dmg"
    sha256 "82aedfaa6e3576820ee86f86df0dc31fd5a4e366334ac4fd7efb78a893e97151"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.1/zedg-zh-cn-macos-x86_64-v0.230.1.dmg"
    sha256 "6fb798ae0c666445bae95560afaf010f78940acfdfe95a921ecba17faa46f85f"
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
