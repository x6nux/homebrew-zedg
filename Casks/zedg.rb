cask "zedg" do
  version "1.23.2"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.2/zedg-zh-cn-macos-aarch64-v1.23.2.dmg"
    sha256 "5f76fc0adf3bc907857f8d126bf66f90a4265128e0c270731a0a4a73a367a442"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.23.2/zedg-zh-cn-macos-x86_64-v1.23.2.dmg"
    sha256 "8ab6b40d2f49ee318c635abaf20ce6e66a9ac790312a73a15c54f4f2bbb38c9c"
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
