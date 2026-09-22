# DumontAI Homebrew tap

Internal Dumont apps, installable with Homebrew.

```bash
brew tap dumontai/tap
brew install --cask dumont-code
```

This tap is public, because the cask holds only URLs and checksums and the DMGs it
points at are already served publicly from `dumont.au`. Nothing here is a secret. If
the apps should stop being publicly discoverable, make this repo private and put the
downloads behind auth, in that order; making only this repo private achieves nothing
while the `dumont.au` URLs stay open.

## Releasing a new version

The app updates itself through electron-updater, so the cask is for **installation**,
not for updates. `auto_updates true` tells Homebrew not to fight it.

Still bump the cask on each release so a fresh install gets the current build:

1. publish the release with `dumont/publish-mac.sh` in the desktop fork
2. update `version` and both `sha256` values in `Casks/dumont-code.rb`
3. `brew audit --cask --online dumont-code` then commit

Both checksums come from the published DMGs:

```bash
V=1.18.32-dumont.1
for a in arm64 x64; do
  curl -sL "https://dumont.au/desktop/code/prod/$V/dumont-code-desktop-mac-$a.dmg" | shasum -a 256
done
```

## Known limitation

The Intel (`x64`) build is signed and notarised but has never been run on Intel
hardware. See the desktop fork's README.
