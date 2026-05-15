cask "zedg" do
  version "1.2.4"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.4/zedg-zh-cn-macos-aarch64-v1.2.4.dmg"
    sha256 "a744f09f3457f09032fceb3101cdb614e73b59e3f212413aa7e1fcbbe3801c27"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.4/zedg-zh-cn-macos-x86_64-v1.2.4.dmg"
    sha256 "83afae3f4484488add6a9e5ef2998782f9e52b2078c9dd1b127b790c55647bdd"
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
