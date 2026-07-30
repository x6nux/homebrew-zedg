cask "zedg-preview" do
  version "1.14.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.1-pre/zedg-zh-cn-macos-aarch64-v1.14.1-pre.dmg"
    sha256 "f11622b66dc3abd2fdbb00023dd1213a5470aa336847070ac2895c81d6c0ccc9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.14.1-pre/zedg-zh-cn-macos-x86_64-v1.14.1-pre.dmg"
    sha256 "2b4990cb38bcc203dc4498ab8ec7c6581b5e3dcb73c18b5cf7b07a80629c6281"
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
