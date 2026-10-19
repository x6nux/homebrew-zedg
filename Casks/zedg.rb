cask "zedg" do
  version "1.24.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.3/zedg-zh-cn-macos-aarch64-v1.24.3.dmg"
    sha256 "887cb09e9a151a2140dac220823adda0234ffd17eeccc06eee5ac787287b56d7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.3/zedg-zh-cn-macos-x86_64-v1.24.3.dmg"
    sha256 "8da3c2e1a8b5b55ff37c65b7dabbb13046b723a94f7061119f7cd3bc1f0c82f9"
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
