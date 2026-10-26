# Tech-Maou Homebrew tap

Homebrew casks for [AeroStage](https://github.com/Tech-Maou/AeroStage) and
[AeroStage WM](https://github.com/Tech-Maou/AeroStage-WM).

```bash
brew install --cask tech-maou/tap/aerostage
```

This installs AeroStage and, as a dependency, AeroStage WM, the window manager it is made for.
AeroStage WM conflicts with the original AeroSpace; uninstall that first
(`brew uninstall --cask aerospace`), your `~/.aerospace.toml` is kept.

| Cask | App |
|---|---|
| `aerostage` | Stage Manager–style sidebar |
| `aerostage-wm` | Tiling window manager based on [AeroSpace](https://github.com/nikitabobko/AeroSpace) |

Both apps are signed with a self-signed certificate and are not notarized by Apple (the
project has no paid Apple developer account). The casks therefore remove the quarantine
attribute after installation so macOS can launch them.

## Updating the casks

The release scripts of both repositories (`scripts/release.sh`) build the zip, print its
SHA256 and update the matching cask here when this repository is checked out next to them.

## License

[MIT](LICENSE)
