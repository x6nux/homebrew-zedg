cask "zedg" do
  version "1.4.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.2/zedg-zh-cn-macos-aarch64-v1.4.2.dmg"
    sha256 "f653bd66a26bea64f013e654ee1db0d139e7cb2a24143bf7ec3c1ac944614d9f"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.4.2/zedg-zh-cn-macos-x86_64-v1.4.2.dmg"
    sha256 "395583044315f3f815ae4070a2cf9bb2884b0ff3d690c3807f3f446edcd179f6"
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
