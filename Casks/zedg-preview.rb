cask "zedg-preview" do
  version "0.229.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.229.0-pre/zedg-zh-cn-macos-aarch64-v0.229.0-pre.dmg"
    sha256 "a75ab7e265cf944280fd289bfcfa86b9f7d0f34bd549119abf9bca4b7325acd9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.229.0-pre/zedg-zh-cn-macos-x86_64-v0.229.0-pre.dmg"
    sha256 "55a53e5411b43a2297aaca3bb4bb15570b73a5f17526954bc2f62589342f4a86"
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
