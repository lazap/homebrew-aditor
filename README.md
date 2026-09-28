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

Aditor is not yet signed with an Apple Developer ID certificate, so macOS
Gatekeeper will refuse to open it after installation. Clear the quarantine
attribute once:

```sh
xattr -dr com.apple.quarantine "/Applications/Aditor.app"
```

This step goes away once signed builds are published.

## Updating

```sh
brew update && brew upgrade --cask aditor
```

## Maintenance

`Casks/aditor.rb` is rewritten automatically by the `update-cask` workflow in
[lazap/aditor](https://github.com/lazap/aditor) whenever a release is published
there. Edit the cask directly only for changes that aren't the version or the
checksums.
