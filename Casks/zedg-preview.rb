cask "zedg-preview" do
  version "1.19.1-pre.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.1-pre.1/zedg-zh-cn-macos-aarch64-v1.19.1-pre.dmg"
    sha256 "2aa9d40efde72039c6886e475b5ede9aacd69d423d773c3ce863ef32df0ecea2"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.1-pre.1/zedg-zh-cn-macos-x86_64-v1.19.1-pre.dmg"
    sha256 "433df6e7a2aa3ee8fa78e3307c7655d4e9f5121ba6d8a4a0edc995e241c73ec8"
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
