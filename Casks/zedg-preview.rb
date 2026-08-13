cask "zedg-preview" do
  version "1.16.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.0-pre/zedg-zh-cn-macos-aarch64-v1.16.0-pre.dmg"
    sha256 "134339ba7264d3a921cbb22c14d04ca91cc2283996bee1f05375eb8d83511a1f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.16.0-pre/zedg-zh-cn-macos-x86_64-v1.16.0-pre.dmg"
    sha256 "5eeeb933130f4ce4e2e36ff236c383969220b4f15460bfc5fc162c7d6e588035"
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
