cask "zedg-preview" do
  version "1.5.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.1-pre/zedg-zh-cn-macos-aarch64-v1.5.1-pre.dmg"
    sha256 "e8de23fa3b764af42115f5a74959836f377ddb92f42bfbb2a40e3a41cce8576e"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.1-pre/zedg-zh-cn-macos-x86_64-v1.5.1-pre.dmg"
    sha256 "6e33fc154fd447821d2b3406c9064708093465a3b1e82b4ddb2bcc131886337a"
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
