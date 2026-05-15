cask "zedg" do
  version "1.2.5"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.5/zedg-zh-cn-macos-aarch64-v1.2.5.dmg"
    sha256 "1b5ad62ee4ebe6514896db42607634a198d7aa9621280f7b35cb2bc6a9f232e3"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.2.5/zedg-zh-cn-macos-x86_64-v1.2.5.dmg"
    sha256 "0fccbed05c183c035094ae6146d5af237e9f577259025b4f33962aff5c2dbe64"
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
