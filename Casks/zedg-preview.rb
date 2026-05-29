cask "zedg-preview" do
  version "1.5.3-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.3-pre/zedg-zh-cn-macos-aarch64-v1.5.3-pre.dmg"
    sha256 "0dbb433465dafed6ebd13c3bb4e43cb6943c08f690b870931b2e284bb1087681"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.3-pre/zedg-zh-cn-macos-x86_64-v1.5.3-pre.dmg"
    sha256 "1e2fe896d330b9ced467a9ddaa62f33c2059b05162f7d3d2e2da080cdb86e100"
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
