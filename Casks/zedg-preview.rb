cask "zedg-preview" do
  version "1.1.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.3-pre/zedg-zh-cn-macos-aarch64-v1.1.3-pre.dmg"
    sha256 "3aca6d0b6aae8e7ef0f610a8c227bc2299e9af9589e9fbe9cb50cb2ebf3474ef"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.3-pre/zedg-zh-cn-macos-x86_64-v1.1.3-pre.dmg"
    sha256 "dfa095fe7e8eb59fd8524241da1ba84f233d3ba48872f6cb9fb422ffc976263f"
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
