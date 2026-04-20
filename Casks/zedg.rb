cask "zedg" do
  version "0.232.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.3/zedg-zh-cn-macos-aarch64-v0.232.3.dmg"
    sha256 "983cc9d4e3901d04f4ff3620b7dc84fa7570d2e1bc1caf9504bf985ba74517ab"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.232.3/zedg-zh-cn-macos-x86_64-v0.232.3.dmg"
    sha256 "4f311a84be324e4a64ed44aef24e1d19f0ec582944859a791e8f476c6f5556c8"
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
