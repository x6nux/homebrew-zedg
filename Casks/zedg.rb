cask "zedg" do
  version "0.226.4"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.4/zedg-zh-cn-macos-aarch64-v0.226.4.dmg"
    sha256 "2e8ea8d4b04eb7e47e286e86b15eb7e54accf3d83701d12ba1a5861795d51985"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.4/zedg-zh-cn-macos-x86_64-v0.226.4.dmg"
    sha256 "44d3b4fd060fb4eca3855b21498d297bc2cce6c692165281fa341b9025e7fa78"
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
