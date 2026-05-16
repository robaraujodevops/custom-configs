# Custom Configs

Personal configuration repository for a Linux development environment. It
collects shell, terminal, editor, font, tmux, and automation files used to set
up or restore a workstation.

## Contents

- `zsh/`: Zsh configuration, including `.zshrc`, the versioned `.zshenv`
  defaults, optional local `.zshxenv` overrides, aliases, theme, libraries, and
  plugins.
- `nvim/`: Neovim configuration based on LazyVim.
- `konsole/`: Konsole profiles, color schemes, shortcuts, and layouts.
- `scripts/`: helper scripts for the terminal, tmux, battery status, and fonts.
- `.fonts/`: versioned fonts used in the environment.
- `automation/`: task-specific automations, such as initializing Google Cloud
  authentication in a remote session.
- `etc/`: system configuration files, such as `sudoers` rules.
- `.tmux.conf`: main tmux configuration.
- `swiss-army-knife/`: useful Linux notes and commands.

## Basic Setup

Clone the project into a configuration location, for example:

```bash
git clone git@github.com:robaraujodevops/custom-configs.git ~/.config/custom-configs
cd ~/.config/custom-configs
git submodule update --init --recursive
```

To use the Zsh configuration, install Zsh on the system, copy or symlink
`zsh/.zshenv` into the `$HOME` directory, and set Zsh as the default shell:

```bash
ln -s ~/.config/custom-configs/zsh/.zshenv ~/.zshenv
chsh -s /bin/zsh
```

Sensitive values and machine-local overrides should live in
`zsh/.zshxenv`. This file is loaded by `zsh/.zshrc` after `.zshenv` and is
ignored by Git, so use it for API keys, private host paths, work credentials,
VPN variables, and other local-only exports:

```bash
touch ~/.config/custom-configs/zsh/.zshxenv
chmod 600 ~/.config/custom-configs/zsh/.zshxenv
```

To install the helper fonts:

```bash
./scripts/nerd-font.sh
```

## Neovim

The configuration in `nvim/` uses LazyVim. To enable it, point the Neovim
configuration directory to this repository:

```bash
ln -s ~/.config/custom-configs/nvim ~/.config/nvim
```

Then open Neovim so LazyVim can install and sync the plugins defined in the
project.

## Notes

- Review files before applying symlinks or copying configurations into the
  system, especially files under `etc/`.
- Keep `.zshenv` free of secrets. Put sensitive environment variables in the
  ignored `zsh/.zshxenv` file instead.
- Some scripts assume tools are already installed, such as `zsh`, `tmux`,
  `gcloud`, `curl`, `unzip`, and `fc-cache`.
- The `install_fonts.sh` script appears to be an older variant of the font
  installer. Prefer `scripts/nerd-font.sh`.
