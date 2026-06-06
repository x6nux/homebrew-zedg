cask "zedg" do
  version "1.5.4"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.4/zedg-zh-cn-macos-aarch64-v1.5.4.dmg"
    sha256 "fd7fee231c6d201809d46a20b14503afa346c8a427f84bfa8860cb25002a0565"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.4/zedg-zh-cn-macos-x86_64-v1.5.4.dmg"
    sha256 "2b7239d7710e2c04d411bfd1416c88dda89ad8ed5e57d295b0b8ef6901fb4336"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
