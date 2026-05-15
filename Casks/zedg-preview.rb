cask "zedg-preview" do
  version "1.3.1-pre"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.1-pre/zedg-zh-cn-macos-aarch64-v1.3.1-pre.dmg"
    sha256 "384ee96a0fec89fa97e6fa985adafa45519ef67535cc9300a036cd899b8dbf08"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v1.3.1-pre/zedg-zh-cn-macos-x86_64-v1.3.1-pre.dmg"
    sha256 "2c69d3660491e01762105f9ecc2f1eec4a4926a7f06728cbf6ea0dea97f23967"
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
