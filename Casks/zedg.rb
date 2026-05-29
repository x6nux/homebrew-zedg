cask "zedg" do
  version "1.4.4"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.4/zedg-zh-cn-macos-aarch64-v1.4.4.dmg"
    sha256 "10baed5002a0cb618708759a545d9f3ded21a73704cb905be444dc2a7b2c91a7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.4/zedg-zh-cn-macos-x86_64-v1.4.4.dmg"
    sha256 "8f679ac2def9b69b4ee74d08c3a90791f0a6fb27a7abc6c2f3d46d30de0ef357"
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
