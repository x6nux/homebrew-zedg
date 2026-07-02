cask "zedg-preview" do
  version "1.10.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.0-pre/zedg-zh-cn-macos-aarch64-v1.10.0-pre.dmg"
    sha256 "4cc705a3156d1cf8d7dcb19464e5ea8d8ced6bbb76fd01f82d527e3e0313a339"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.10.0-pre/zedg-zh-cn-macos-x86_64-v1.10.0-pre.dmg"
    sha256 "c09224a0bccfd9a22d08921916de96d6daaf604ec67cbfc74e8603f31dbe3f8b"
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
