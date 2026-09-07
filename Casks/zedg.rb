cask "zedg" do
  version "1.18.1.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.1.1/zedg-zh-cn-macos-aarch64-v1.18.1.dmg"
    sha256 "52c6556911777418edbe89eae687db2342d680650b5b1e00c4adbb3061f3e3e7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.18.1.1/zedg-zh-cn-macos-x86_64-v1.18.1.dmg"
    sha256 "01b59e5ff57558de64725f43e18a8226bb04a23bf863f348fe7c567c143bb60f"
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
