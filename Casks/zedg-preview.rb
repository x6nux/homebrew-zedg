cask "zedg-preview" do
  version "1.6.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.1-pre/zedg-zh-cn-macos-aarch64-v1.6.1-pre.dmg"
    sha256 "f6f84ba6584547d8500e8bd8d131cba4030047e66769108cd505766f7a7ef529"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.1-pre/zedg-zh-cn-macos-x86_64-v1.6.1-pre.dmg"
    sha256 "14c2b21732b4d745b33fd0c770eb5b35914eaa1bcfec56eb6d0892ca150a5a40"
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
