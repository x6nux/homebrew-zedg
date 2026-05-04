cask "zedg" do
  version "1.0.1"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.0.1/zedg-zh-cn-macos-aarch64-v1.0.1.dmg"
    sha256 "b5bd78122667d996e360b869f6b0ad0fe0811691a2456d232bf5021374841c95"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.0.1/zedg-zh-cn-macos-x86_64-v1.0.1.dmg"
    sha256 "6634f3010da72fea5005b6c46393598df74c231eb8da7b57103d10a7ba0434ac"
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
