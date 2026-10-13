cask "zedg" do
  version "1.23.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.3/zedg-zh-cn-macos-aarch64-v1.23.3.dmg"
    sha256 "d69fbde965e3fa1e2d847fe101b79832b65f41fe62e9e00199231bbd5c8276a6"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.3/zedg-zh-cn-macos-x86_64-v1.23.3.dmg"
    sha256 "efe69f09a158e5b4dece8d7c4f79740c1e4a876c61c123d518deb95fcde96b6f"
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
