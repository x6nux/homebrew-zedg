cask "zedg-preview" do
  version "0.226.4-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.4-pre/zedg-zh-cn-macos-aarch64-v0.226.4-pre.dmg"
    sha256 "ecb213e8e515a8effb497a8440b84f44b7697c11770126c98d50d3feeec461c6"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.4-pre/zedg-zh-cn-macos-x86_64-v0.226.4-pre.dmg"
    sha256 "e1457782e537f1d3775863db3cc511ef6c30b28c4fcf26de426a404027b76740"
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
