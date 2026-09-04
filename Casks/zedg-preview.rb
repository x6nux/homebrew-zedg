cask "zedg-preview" do
  version "1.19.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.0-pre/zedg-zh-cn-macos-aarch64-v1.19.0-pre.dmg"
    sha256 "65070af0d98ba24d0e3db7c0f14e9fb5e24b3bdee4ca516cb8911b30a9a670e4"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.0-pre/zedg-zh-cn-macos-x86_64-v1.19.0-pre.dmg"
    sha256 "2505e41509a47933c36d462b507be96b0320ae7084b48d4c65426dead1e1d363"
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
