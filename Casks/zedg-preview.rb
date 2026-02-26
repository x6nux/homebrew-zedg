cask "zedg-preview" do
  version "0.226.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.0-pre/zedg-zh-cn-macos-aarch64-v0.226.0-pre.dmg"
    sha256 "9f8ae8bd99d6b2850f2ee5255d0dffdad9966526f5882db5b3eff134e59c4d73"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.0-pre/zedg-zh-cn-macos-x86_64-v0.226.0-pre.dmg"
    sha256 "9d735cf3986c8b38c9e7e0ee2f27b3f7808b36c0091fca0b6edf5f9c868baba5"
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
