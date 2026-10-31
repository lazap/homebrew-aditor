# homebrew-aditor

Homebrew tap for [Aditor](https://github.com/lazap/aditor) — a lightweight
editor whose main pane is an agent CLI.

## Install

```sh
brew tap lazap/aditor
brew install --cask aditor
```

Homebrew 6 asks you to explicitly trust a third-party tap the first time it
evaluates one. That prompt is expected.

Aditor builds are ad-hoc signed but not notarized. The cask clears the
quarantine flag after installing, so the app opens without a Gatekeeper prompt.

## Updating

```sh
brew update && brew upgrade --cask aditor
```

## Maintenance

The release script in [lazap/aditor](https://github.com/lazap/aditor) bumps
`version` and `sha256` in `Casks/aditor.rb` after each live release. If it
could not, it prints both values: set `version`, and set `sha256` to the
`Aditor_<version>_aarch64.zip` line of that release's `SHA256SUMS.txt`, then
check it:

```sh
brew audit --cask --strict lazap/aditor/aditor
```
