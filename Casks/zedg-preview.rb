cask "zedg-preview" do
  version "1.1.5-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.5-pre/zedg-zh-cn-macos-aarch64-v1.1.5-pre.dmg"
    sha256 "949aa096fd09d0378105354ac7b5b11b266692534e26e3f9f8a0c02a3a52e798"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.1.5-pre/zedg-zh-cn-macos-x86_64-v1.1.5-pre.dmg"
    sha256 "437a317e982ecd5fa2bca0ac21c88ee763f697051b8637577805928bac1749ed"
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
