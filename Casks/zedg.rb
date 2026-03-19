cask "zedg" do
  version "0.228.0"

  on_arm do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0/zedg-zh-cn-macos-aarch64-v0.228.0.dmg"
    sha256 "b8cac66ceeaad88f20eadbdf68401260acbad8e965539d0baa4d8d717f0453ce"
  end
  on_intel do
    url "https://github.com/x6nux/zed-globalization/releases/download/v0.228.0/zedg-zh-cn-macos-x86_64-v0.228.0.dmg"
    sha256 "3d1e850fd5adbdeabd848ced4eb7764cd62d00c7ec9db3d3abcfd68b63c68c73"
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
