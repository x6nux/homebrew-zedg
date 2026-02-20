cask "zedg-preview" do
  version "0.225.4-pre"
  sha256 "797346859ab39fb2b35f4ee454f99ac2bc856ecf36400cb1544e2fc14a1d4860"

  url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.4-pre/zedg-zh-cn-macos-aarch64-v0.225.4-pre.dmg"
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
