cask "zedg" do
  version "0.223.3.1"
  sha256 "5870e2e59898312a7093ecaf5e419f1e0a578982a1ad76f23f91b0ec3d4132c6"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.223.3.1/zedg-zh-cn-macos-aarch64-v0.223.3.dmg"
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
