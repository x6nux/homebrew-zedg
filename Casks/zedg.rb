cask "zedg" do
  version "1.16.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.2/zedg-zh-cn-macos-aarch64-v1.16.2.dmg"
    sha256 "be14073fd04499bc7b8ee3eca2fa0e8258c1ab0d1a8531332867c8a7dae385fb"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.2/zedg-zh-cn-macos-x86_64-v1.16.2.dmg"
    sha256 "855a5dcb2f9d57d9e51e9073b20384a96b93b9bbb6d2f4ccfc655d644f090c82"
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
