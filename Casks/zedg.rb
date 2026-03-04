cask "zedg" do
  version "0.225.13"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.13/zedg-zh-cn-macos-aarch64-v0.225.13.dmg"
    sha256 "b982f5512dcbcc3e19b34f5fcf756f9d4bb9be62abda87afd403472fa0d62fc3"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.225.13/zedg-zh-cn-macos-x86_64-v0.225.13.dmg"
    sha256 "a38788e9eb0a8c363fbb23cfea04a60fcd0fb6d5026254f1c35cc75173ee6954"
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
