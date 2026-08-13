cask "zedg" do
  version "1.15.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.0/zedg-zh-cn-macos-aarch64-v1.15.0.dmg"
    sha256 "9095010ae70ab9e88d8330cf4b2c733e05750377393300ffe327356b782a2e97"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.15.0/zedg-zh-cn-macos-x86_64-v1.15.0.dmg"
    sha256 "f83a3b5bb508e502c9f8fb12f66d52ab643521aefeadc4c748e39dc258e97629"
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
