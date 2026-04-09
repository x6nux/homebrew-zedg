cask "zedg" do
  version "0.231.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.1/zedg-zh-cn-macos-aarch64-v0.231.1.dmg"
    sha256 "3b281a70c930166c7eb5a289f255af2d05db91f9211ee8bd77b014d922068162"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.1/zedg-zh-cn-macos-x86_64-v0.231.1.dmg"
    sha256 "3d23150cf5c1165121f3b01c8cfc9c6ba52272525f33e340205547adcd804ad5"
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
