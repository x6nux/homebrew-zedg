cask "zedg" do
  version "1.1.8"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.8/zedg-zh-cn-macos-aarch64-v1.1.8.dmg"
    sha256 "7f02e84732ed34c56f8fa63329a4225e721b32b9b6433200e8c7f91f89ca771e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.8/zedg-zh-cn-macos-x86_64-v1.1.8.dmg"
    sha256 "0a3f4ca5317816c9bda46d8cfbcf497ac26ecbca57decc9ade6b09625e01dc21"
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
