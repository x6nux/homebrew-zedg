cask "zedg" do
  version "1.2.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.3/zedg-zh-cn-macos-aarch64-v1.2.3.dmg"
    sha256 "d8839c10ab3d5d3151d2d54b24bdde65b5d1182cb840d326aee6e4c4e15bd225"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.3/zedg-zh-cn-macos-x86_64-v1.2.3.dmg"
    sha256 "6234fb66d3931f90177f5f8b9cd2790950a6d7013a56afdc845ece37274939d2"
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
