cask "zedg-preview" do
  version "0.233.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.2-pre/zedg-zh-cn-macos-aarch64-v0.233.2-pre.dmg"
    sha256 "5daaabef43e90e19748961633c316b3b5bfa21efd8dadae082dffbc63c5150f9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.2-pre/zedg-zh-cn-macos-x86_64-v0.233.2-pre.dmg"
    sha256 "e95f64a744e7de6c9031ea19ed9bbaf1afdb89433bfc1b39e77c2f93fb3e660e"
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
