cask "zedg" do
  version "1.9.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.9.0/zedg-zh-cn-macos-aarch64-v1.9.0.dmg"
    sha256 "79246c165e0aec4ac5a9615b04953212ba99fe175bc6e569957e7b4dc2fb16f9"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.9.0/zedg-zh-cn-macos-x86_64-v1.9.0.dmg"
    sha256 "bf21a89510d699078bdc6814ec55cceaa6282dc020366f90540a03a29dae6a2d"
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
