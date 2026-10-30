cask "aerostage" do
  version "1.4.3"
  sha256 "fc14fd7e1135a3a8f0042c86b595c86588c85d4542f6850b836f43daa688c6bc"

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
    "~/Library/Application Support/AeroStage",
    "~/Library/Preferences/io.github.tech-maou.AeroStage.plist",
  ]
end
