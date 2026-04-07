cask "zedg" do
  version "0.230.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.2/zedg-zh-cn-macos-aarch64-v0.230.2.dmg"
    sha256 "79200d99f1e1c12707409dc1b248861010037cfc1cedb83a125225a4a0445d46"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.230.2/zedg-zh-cn-macos-x86_64-v0.230.2.dmg"
    sha256 "346d6c253ebc441618dbe21abd83046976b91fe74a2324d06e03195f62e3715e"
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
