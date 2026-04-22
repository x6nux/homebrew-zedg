cask "zedg-preview" do
  version "0.233.5-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.5-pre/zedg-zh-cn-macos-aarch64-v0.233.5-pre.dmg"
    sha256 "24f5c4f8d43f53fc6269911e7f492bc26544972a9deacb5582e4b9f3fa733e81"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.233.5-pre/zedg-zh-cn-macos-x86_64-v0.233.5-pre.dmg"
    sha256 "574dd898e920a724b9b43f2b4282acd80a65291fe713f433e252b88b70bf9920"
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
