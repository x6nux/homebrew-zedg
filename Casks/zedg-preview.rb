cask "zedg-preview" do
  version "0.233.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.3-pre/zedg-zh-cn-macos-aarch64-v0.233.3-pre.dmg"
    sha256 "1c0afec7e8e830e146c2d361e09ded52189ad69b4727cb8dea56655eae32c806"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.3-pre/zedg-zh-cn-macos-x86_64-v0.233.3-pre.dmg"
    sha256 "7f9a06dacc68032a08e8366565f019c898cbf62776e677ec1c27d8f9f5a23e7e"
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
