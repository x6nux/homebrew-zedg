cask "zedg-preview" do
  version "0.226.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.1-pre/zedg-zh-cn-macos-aarch64-v0.226.1-pre.dmg"
    sha256 "b1f7e7ad6a841f41acb76499a20de950182b18d91a917cf97d803e8694cb4827"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.226.1-pre/zedg-zh-cn-macos-x86_64-v0.226.1-pre.dmg"
    sha256 "5143ea8c3b235f123c68720b0d82d289455528459f7140a2fdeeef8ed4e611c5"
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
