cask "zedg-preview" do
  version "1.24.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.1-pre/zedg-zh-cn-macos-aarch64-v1.24.1-pre.dmg"
    sha256 "b8bafc870a4bb81b5b03f0dcb397c15e7de2731df1c46fcba98a0e17feaa8bf7"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.24.1-pre/zedg-zh-cn-macos-x86_64-v1.24.1-pre.dmg"
    sha256 "38d9df7502c714fb0edb421d62b083b65647678aaca47d5e890a06b78fbc0e96"
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
