cask "zedg-preview" do
  version "1.19.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.1-pre/zedg-zh-cn-macos-aarch64-v1.19.1-pre.dmg"
    sha256 "cedb212689a769fc69b094d690c23c2e79391ae07e7484b2fd0ccd6dacc6a497"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.19.1-pre/zedg-zh-cn-macos-x86_64-v1.19.1-pre.dmg"
    sha256 "ee66c26c1c62d6f137706b18aba5406b3b83c58dc46c1ae8e8aaabed3d11df6a"
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
