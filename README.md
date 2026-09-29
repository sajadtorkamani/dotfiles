# dotfiles

My personal shell, editor and terminal configuration for macOS (with some Linux support).

## What's included

| Path | Description |
| --- | --- |
| `.zshrc` | Zsh config (Oh My Zsh, NVM, rbenv, Bun, AWS, completions) |
| `aliases/` | Zsh aliases and functions, grouped by topic (git, docker, npm, symfony, etc.) |
| `lib/` | Helpers sourced by `.zshrc` (PATH setup, utils, Linux config, third-party completions) |
| `.vimrc`, `.vim/` | Vim config. Plugins are cloned into `.vim/` by the setup script |
| `.ideavimrc` | IdeaVim config for JetBrains IDEs |
| `.tmux.conf` | tmux config |
| `.config/herdr/` | herdr config and helper scripts |
| `.inputrc` | Readline config |
| `.gitignore_global` | Global gitignore |
| `.rspec` | Default RSpec options |
| `deno.json` | Deno formatter settings |
| `misc/` | Extras such as the Solarized Dark iTerm2 colour scheme |
| `scripts/` | Setup scripts |

## Requirements

- [Oh My Zsh](https://ohmyz.sh/)
- Bash (to run the setup script)
- Git

## Installation

The repo is expected to live at `~/code/dotfiles` (`.zshrc` sources files from that path).

```sh
git clone git@github.com:sajadtorkamani/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
scripts/setup.sh
```

The setup script:

1. Clones Vim plugins into `.vim/` (see `scripts/clone_vim_packages.sh`).
2. Symlinks every file in `aliases/` into `~/.oh-my-zsh/custom/`.
3. Symlinks the dotfiles listed in `scripts/symlink_dotfiles.sh` into `$HOME`.

Existing files are never overwritten — they're skipped with a message, so remove or back them up first if you want them replaced.

Then reload your shell:

```sh
source ~/.zshrc
```

## Adding a new dotfile

1. Add the file to this repo at the same relative path it should have under `$HOME`.
2. Add that path to the `dotfiles` array in `scripts/symlink_dotfiles.sh`.
3. Re-run `scripts/setup.sh`.
