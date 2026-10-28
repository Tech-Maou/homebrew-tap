cask "aerostage-wm" do
  version "0.21.3-stage.5"
  sha256 "a84730b21b43d7d5e47059e9d5e7f6073826eced996abf02d2b1088a735680df"

  url "https://github.com/Tech-Maou/AeroStage-WM/releases/download/v#{version}/AeroStage-WM-v#{version}.zip"
  name "AeroStage WM"
  desc "Tiling window manager based on AeroSpace, made for AeroStage"
  homepage "https://github.com/Tech-Maou/AeroStage-WM"

  conflicts_with cask: "nikitabobko/tap/aerospace"
  depends_on macos: :ventura

  app "AeroStage WM.app"
  binary "#{appdir}/AeroStage WM.app/Contents/Resources/bin/aerostage-wm"

  # Not notarized (no paid Apple developer account), so remove the quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AeroStage WM.app"], must_succeed: false
  end

  # Quit first, so all windows return to the screen; `brew upgrade` opens the app again.
  uninstall quit: "io.github.tech-maou.AeroStageWM"

  zap trash: [
    "~/Library/LaunchAgents/io.github.tech-maou.AeroStageWM.plist",
    "~/Library/Preferences/io.github.tech-maou.AeroStageWM.plist",
  ]
end
