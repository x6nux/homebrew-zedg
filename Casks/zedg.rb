cask "zedg" do
  version "1.12.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.1/zedg-zh-cn-macos-aarch64-v1.12.1.dmg"
    sha256 "e306d32e9c1d60be4e68ad43bdde4c2bdb4a2703ba116aa40c53b1ecc85dbba3"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.12.1/zedg-zh-cn-macos-x86_64-v1.12.1.dmg"
    sha256 "72ec1ab106d06ef4531f0cc00567223ce2ea3fe7a7da9b4010e09908fcb41686"
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
