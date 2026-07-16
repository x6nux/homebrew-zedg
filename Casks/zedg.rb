cask "zedg" do
  version "1.11.3"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.3/zedg-zh-cn-macos-aarch64-v1.11.3.dmg"
    sha256 "63ea773e9788d8ffa6de65f242dd5682a5c31c046825ffdcfb4e9cad67ea3ed5"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.11.3/zedg-zh-cn-macos-x86_64-v1.11.3.dmg"
    sha256 "fa3fcdc5956d7b565b1928e5ad2a7cd87563527916fa5aec893a30c5e5bc2751"
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
