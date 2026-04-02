cask "zedg-preview" do
  version "0.231.0-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.0-pre/zedg-zh-cn-macos-aarch64-v0.231.0-pre.dmg"
    sha256 "e2430a3dfbe330013990f0d9fad7dbe4f819bc9c0611ca2044998fbe854f99a9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.231.0-pre/zedg-zh-cn-macos-x86_64-v0.231.0-pre.dmg"
    sha256 "f0312a1c268f9687a8d65ddd56452860a82b613f4dde882a3cc054a3728b5ae6"
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
