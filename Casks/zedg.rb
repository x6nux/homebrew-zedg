cask "zedg" do
  version "0.233.9"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.9/zedg-zh-cn-macos-aarch64-v0.233.9.dmg"
    sha256 "9d3470a4ec7701f32ca2d5774c84265bdf49c09d3484ff85ba348f1005eb3b0c"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.9/zedg-zh-cn-macos-x86_64-v0.233.9.dmg"
    sha256 "2e8feb587cd6da133f2b19b133ef004e2f28b3bfee2db67b4c4760eefd1d30a2"
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
