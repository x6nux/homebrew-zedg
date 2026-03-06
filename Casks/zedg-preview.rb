cask "zedg-preview" do
  version "0.226.5"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.5/zedg-zh-cn-macos-aarch64-v0.226.5.dmg"
    sha256 "79c4a292fa16e8b5ef61d56997131866af61c0782c370cf2311480652185e5ad"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.5/zedg-zh-cn-macos-x86_64-v0.226.5.dmg"
    sha256 "edc61be8d746a043c0d4d212c642c93caa533289924cddea7ca98f1657d0b50a"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
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
