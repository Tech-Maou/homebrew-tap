cask "aerostage" do
  version "1.3.2"
  sha256 "48dfbfa7df5fbba757e64e1985c961146a330cbef0be80e920c90affd5e6ad3c"

  url "https://github.com/Tech-Maou/AeroStage/releases/download/v#{version}/AeroStage-v#{version}.zip"
  name "AeroStage"
  desc "Stage Manager-style sidebar for AeroStage WM and AeroSpace"
  homepage "https://github.com/Tech-Maou/AeroStage"

  depends_on cask: "tech-maou/tap/aerostage-wm"
  depends_on macos: :sonoma

  app "AeroStage.app"
  binary "#{appdir}/AeroStage.app/Contents/Helpers/aerostage"

  # Not notarized (no paid Apple developer account), so remove the quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AeroStage.app"], must_succeed: false
  end

  # Quit before uninstalling or upgrading; `brew upgrade` opens the app again afterwards.
  uninstall quit: "io.github.tech-maou.AeroStage"

  zap trash: [
    "~/.aerospace.toml.aerostage-backup",
    "~/Library/Application Support/AeroStage",
    "~/Library/Preferences/io.github.tech-maou.AeroStage.plist",
  ]
end
