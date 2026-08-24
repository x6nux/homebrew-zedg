cask "zedg-preview" do
  version "1.17.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.1-pre/zedg-zh-cn-macos-aarch64-v1.17.1-pre.dmg"
    sha256 "29ede3f19afe7b48360ff6f1d261c1bb0be3dc4e1c7ad9854dfffbb56252a608"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.17.1-pre/zedg-zh-cn-macos-x86_64-v1.17.1-pre.dmg"
    sha256 "d2f23b33e60b809f162b4d6474e3258a4713b670d4cd464c0ffc472a33a4102a"
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
