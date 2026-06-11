cask "zedg" do
  version "1.6.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.3/zedg-zh-cn-macos-aarch64-v1.6.3.dmg"
    sha256 "ff364230379a7187e497304b9717b0d560b08e5d4177f77cab2a972dac76fb59"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.6.3/zedg-zh-cn-macos-x86_64-v1.6.3.dmg"
    sha256 "51a7e4b164da724c4e81ac37dde156d2c3716b3646cfbef52d778a300a95f90e"
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
