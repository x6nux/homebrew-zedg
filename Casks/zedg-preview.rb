cask "zedg-preview" do
  version "1.17.2-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.2-pre/zedg-zh-cn-macos-aarch64-v1.17.2-pre.dmg"
    sha256 "7019257f05c56ea5129c7dc08078f26d74b0d4479e929c922f50ae63439c706c"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.2-pre/zedg-zh-cn-macos-x86_64-v1.17.2-pre.dmg"
    sha256 "72b8e900c73a7d9f7e0489599619956401a824bb00e1581f8ffb3f9db3d0d7d5"
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
