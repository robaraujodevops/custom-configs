# Project Handover

This repository is a personal Linux development-environment configuration
bundle. It is not an application with a build pipeline; it stores dotfiles,
terminal/editor configuration, helper scripts, fonts, and small automations used
to bootstrap or restore a workstation.

## Repository Layout

- `README.md`: primary setup overview.
- `zsh/`: Zsh configuration. The entry points are `.zshenv`, optional local
  `.zshxenv`, `.zshrc`, `aliases`, files in `lib/`, the `themes/` directory,
  and bundled plugins in `plugins/`.
- `nvim/`: Neovim configuration based on LazyVim. Main entry point is
  `init.lua`; local customizations live under `lua/config/` and
  `lua/plugins/`.
- `.tmux.conf`: tmux configuration, keybindings, status bar, and helper-script
  integration.
- `scripts/`: shell helpers used by tmux or manual setup, including battery,
  tmux git branch, and font installation helpers.
- `konsole/`: KDE Konsole keytabs, color schemes, layouts, bookmarks, and
  related profile data.
- `.fonts/`: versioned local font files used by the environment.
- `automation/`: workstation/session automations, currently Chrome startup and
  a Google Cloud remote-auth helper.
- `etc/`: system-level configuration snippets such as sudoers rules. Treat this
  directory as sensitive because mistakes can affect host access.
- `swiss-army-knife/`: Linux command notes.
- `nvim-legacy.tar.gz`: legacy Neovim config archive retained for reference.

## Bootstrap Flow

1. Clone the repository into the expected local path. Current shell and tmux
   config hard-code paths under `$HOME/workspace/custom-configs`.
2. Initialize plugin submodules:

   ```bash
   git submodule update --init --recursive
   ```

3. Link Zsh environment loading:

   ```bash
   ln -s ~/workspace/custom-configs/zsh/.zshenv ~/.zshenv
   chsh -s /bin/zsh
   ```

4. Create the optional local-only Zsh secret/override file when needed:

   ```bash
   touch ~/workspace/custom-configs/zsh/.zshxenv
   chmod 600 ~/workspace/custom-configs/zsh/.zshxenv
   ```

   Store API keys, private paths, VPN/work credentials, and other
   workstation-only exports there. The file is ignored by Git.

5. Link the Neovim config:

   ```bash
   ln -s ~/workspace/custom-configs/nvim ~/.config/nvim
   ```

6. Install fonts if needed:

   ```bash
   ./scripts/nerd-font.sh
   ```

7. Open Neovim once and let LazyVim/lazy.nvim install and sync plugins.

## Zsh Notes

- `zsh/.zshenv` sets versioned, non-sensitive defaults such as XDG paths,
  `ZDOTDIR`, editor variables, Go, Composer, NPM, Neovim, and base PATH values.
- `zsh/.zshrc` loads `aliases`, every `zsh/lib/*.zsh` file, selected plugins,
  the `pimped` theme, completions, `~/.fzf.zsh`, `zoxide`, Google Cloud SDK
  shell integration, and `zsh/.zshxenv` when present.
- `zsh/.zshxenv` is the local-only extension point for secrets and
  machine-specific exports. It is intentionally ignored by Git and is sourced
  after `.zshenv`, so it can also override tracked defaults.
- The configured plugin list is `git`, `zsh-autosuggestions`,
  `zsh-completions`, and `zsh-syntax-highlighting`.
- `zsh/plugins/zsh-autosuggestions`,
  `zsh/plugins/zsh-completions`, and
  `zsh/plugins/zsh-syntax-highlighting` are declared as git submodules in
  `.gitmodules`. Update them through submodule commands, not by editing vendor
  files directly.
- `zsh/.zshrc` can clone missing `zsh-users/*` plugins automatically. This
  requires network access and assumes GitHub availability.
- `zsh/aliases` contains destructive convenience aliases and functions. Notably,
  `rm` is aliased to `rm -fr`, and Docker cleanup aliases remove containers,
  images, or both. Review aliases before using this config on a shared machine.
- Some aliases reference old or machine-specific paths such as
  `~/.config/.my-zsh`, `/home/roberto-araujo/vpn-files`, and
  `$HOME/workspace`.
- Keep private machine-only values in an ignored local file such as
  `zsh/.zshxenv` instead of committing them.

## Secret Handling

- Keep `.zshenv` free of secrets. It is tracked and should contain only
  shareable defaults.
- Put API keys, private key material, VPN/work credentials, private host paths,
  and user-specific tokens in `zsh/.zshxenv`.
- Do not read, print, paste, or summarize the contents of `zsh/.zshxenv` during
  routine maintenance. Treat it as a local secret file.
- `zsh/.zshxenv` is listed in `.gitignore`; preserve that ignore rule.
- If any credentials were previously committed, rotate them outside this repo.

## Neovim Notes

- The config is LazyVim-based. `nvim/lazyvim.json` enables extras for Avante,
  Claude Code, Copilot, yanky, prettier, JSON, Markdown, Tailwind, TypeScript,
  ESLint, and dashboard-nvim.
- Plugin lock state is stored in `nvim/lazy-lock.json`.
- Custom user config lives in:
  - `nvim/lua/config/options.lua`: enables true color and line wrap.
  - `nvim/lua/config/keymaps.lua`: buffer navigation, auto-save toggle, and
    Home/End key behavior.
  - `nvim/lua/config/autocmds.lua`: disables autoformat for shell files,
    enables it for TS/TSX/CSS/JS, and runs `checktime` on focus/buffer events.
  - `nvim/lua/plugins/autosave.lua`: enables `pocco81/auto-save.nvim`.
  - `nvim/lua/plugins/ai.lua`: configures `yetone/avante.nvim`, a custom
    OpenAI-compatible provider, and Codex ACP.
  - `nvim/lua/plugins/copilot.lua`: enables Copilot ghost text with Alt-based
    keymaps.
  - `nvim/lua/plugins/neo_tree.lua`: adds a Neo-tree command for sending files
    to Avante.
  - `nvim/lua/plugins/lsp_diagnostics.lua`: customizes LSP diagnostic display.
  - `nvim/lua/plugins/ui.lua`: dashboard and icon-related configuration.
  - `nvim/lua/plugins/z.lua`: disabled LazyVim example/spec file; it returns
    early and does not currently affect runtime behavior.
- AI provider configuration depends on environment variables. Keep tokens in
  `zsh/.zshxenv` or a secret manager, not in committed Lua or shell files.

## tmux Notes

- Prefix is `Alt-w`, not the default `Ctrl-b`.
- Base window index is `1`.
- Pane movement uses Vim keys, with both prefixed and Alt-key variants.
- Splits:
  - `prefix v`: horizontal split.
  - `prefix s`: vertical split with 20 percent size, opened in the current pane
    path.
  - `prefix e`: split with `-bf`.
- `prefix r` reloads `~/workspace/custom-configs/.tmux.conf`.
- Status line uses `battery_level.sh` and optionally `tmux_git_branch.sh`;
  ensure `scripts/` is on `PATH` or call helpers by absolute path.
- `prefix g` runs `automation/gcloud-auth/init-auth.sh`, loads the result into
  the tmux buffer, and pastes it.
- TPM plugins are declared but TPM initialization is commented out. If TPM is
  desired, install it and restore the `run -b '~/.tmux/plugins/tpm/tpm'` line.

## Scripts And Automation

- `scripts/nerd-font.sh` downloads Fira Code v5.2 from GitHub, unzips it into
  `~/.local/share/fonts`, removes the downloaded zip, and runs `fc-cache -f`.
  It requires `curl`, `unzip`, and `fc-cache`.
- `install_fonts.sh` appears to be an older or broken variant of the font
  installer. Prefer `scripts/nerd-font.sh` unless this file is repaired.
- `scripts/battery_level.sh` supports macOS through `pmset` and Linux through
  `upower`; otherwise it prints `N/A`.
- `scripts/tmux_git_branch.sh` reads the active tmux pane path and prints the
  current Git branch when inside a repository.
- `automation/gcloud-auth/init-auth.sh` scrapes a recent remote auth URL from
  tmux pane output, then runs `gcloud auth login --remote-bootstrap=...`. It is
  tightly coupled to tmux and Google Cloud SDK output.
- `automation/init-chrome.py` requires Python plus `psutil`, assumes Chrome is
  installed at `/opt/google/chrome/google-chrome`, and opens a fixed set of
  work URLs when Chrome is not already running.

## System Configuration

- `etc/sudoers/10-my-sudo` is a sudoers snippet, not a file to source from the
  shell. Validate it with `visudo -cf` before installing it.
- The sudoers snippet is host/user/group specific. Review host aliases, user
  aliases, and group names before applying it on any machine.

## Maintenance Guidelines

- Preserve user-specific behavior unless intentionally generalizing the repo.
  Many paths and aliases are tailored to one workstation.
- Keep secrets and machine-local values out of tracked files. Use
  `zsh/.zshxenv` for local overrides and do not inspect it unless the owner
  explicitly asks.
- Do not edit vendored plugin directories unless the intent is to carry a local
  fork. Use git submodule updates for Zsh plugins.
- Before changing shell startup files, test in a disposable shell:

  ```bash
  ZDOTDIR="$PWD/zsh" zsh -f
  source "$PWD/zsh/.zshrc"
  ```

- Before changing tmux config, validate by reloading inside a noncritical tmux
  session:

  ```bash
  tmux source-file .tmux.conf
  ```

- Before changing Neovim config, run:

  ```bash
  nvim --headless "+Lazy! sync" +qa
  nvim --headless "+checkhealth" +qa
  ```

- For shell scripts, use `shellcheck` where available.
- For Lua formatting, follow the existing LazyVim/stylua setup and run stylua
  when available.

## Known Risks And Cleanup Candidates

- Sensitive environment variables have been moved out of tracked `.zshenv`.
  Keep them in ignored `zsh/.zshxenv` and rotate any values that were exposed
  before this split.
- Multiple files contain hard-coded absolute paths under
  `/home/roberto-araujo` or `$HOME/workspace/custom-configs`; these should be
  parameterized if the repo is shared.
- `install_fonts.sh` contains invalid commands and should either be fixed or
  removed after confirming `scripts/nerd-font.sh` covers the use case.
- `zsh/.zcompdump*`, Konsole cache/backup files, and `tmux-client-*.log` are
  generated artifacts. Consider removing tracked generated files and expanding
  `.gitignore`.
- The Zsh aliases override basic commands (`rm`, `cp`, `mv`) and include broad
  Docker cleanup commands. Use with care on production or shared hosts.
- Submodule state should be checked after clone. A leading `-` in
  `git submodule status` means the submodule is not initialized in the current
  worktree.
