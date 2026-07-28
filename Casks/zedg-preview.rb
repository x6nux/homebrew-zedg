cask "zedg-preview" do
  version "1.13.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.1-pre/zedg-zh-cn-macos-aarch64-v1.13.1-pre.dmg"
    sha256 "03265ad108fc994aa93d6615ffe58631f89f0f9e02fbb06a4e2c1f5d5cd68b55"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.13.1-pre/zedg-zh-cn-macos-x86_64-v1.13.1-pre.dmg"
    sha256 "c4932eb35382f74f2adace29c8056fda1899a2562b59685fcd8a00b997b4c0a8"
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
