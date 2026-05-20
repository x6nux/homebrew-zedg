cask "zedg-preview" do
  version "1.3.5-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.5-pre/zedg-zh-cn-macos-aarch64-v1.3.5-pre.dmg"
    sha256 "37231b4d6d4689e87e68bb3b61f6d35eab41432e7221a9210714e23ff268abf8"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.5-pre/zedg-zh-cn-macos-x86_64-v1.3.5-pre.dmg"
    sha256 "55596d34481d594246912adef87bdfc590e7578923f7005385b97a6c2b93663a"
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
