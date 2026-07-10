cask "zedg" do
  version "1.10.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.1/zedg-zh-cn-macos-aarch64-v1.10.1.dmg"
    sha256 "28abc7f4d574cb02c66d04853c8977aacf8296a1e6f1802fed97e9c822412f26"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.1/zedg-zh-cn-macos-x86_64-v1.10.1.dmg"
    sha256 "1d32b481a1c052e9d6f28c017557056b4aad75d2f910a6bdadb5ddb71bb76772"
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
