cask "aerostage-wm" do
  version "0.21.3-stage.1"
  sha256 "f94691dfc0351a7519520588dd691d408adfcde5d468517e6c4848a1d6c0726a"

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

  zap trash: [
    "~/Library/LaunchAgents/io.github.tech-maou.AeroStageWM.plist",
    "~/Library/Preferences/io.github.tech-maou.AeroStageWM.plist",
  ]
end
