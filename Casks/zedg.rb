cask "zedg" do
  version "1.5.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.3/zedg-zh-cn-macos-aarch64-v1.5.3.dmg"
    sha256 "f3e4b34c908486c0c59e2632c192df84c70566f782e827f7fe43765eb6cf6e45"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.5.3/zedg-zh-cn-macos-x86_64-v1.5.3.dmg"
    sha256 "8bc2b75f4c14e0168b0b86f6f410901efcf03377f2852be5ae046323aa39c8fc"
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
