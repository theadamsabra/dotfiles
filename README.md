# Dotfiles

Stow-based dotfiles for a macOS zsh machine, covering three areas:

- **Terminal** (`.tmux.conf`) — tmux keybindings + embedded Flexoki Dark theme
- **Editor** (`.config/nvim/`) — Neovim via lazy.nvim: LSP, completion, telescope, debugging
- **PI agent** (`.pi/agent/`) — dual-provider model routing to a local OpenAI-compatible server, plus an interactive-subagents extension

The repo root *is* the dotfiles home: it's cloned to `~/dotfiles`, and stow (run from inside the repo) creates relative symlinks into `~` — e.g. `~/.tmux.conf -> dotfiles/.tmux.conf`.

## Docs

| Page | Covers |
|------|--------|
| [Bootstrap](docs/bootstrap.md) | setting up a new machine |
| [Terminal](docs/terminal.md) | tmux keybindings and theme |
| [Editor](docs/editor.md) | Neovim config: plugins, LSP, debugging |
| [PI agent](docs/pi-agent.md) | dual-provider model routing, config generation, interactive subagents |
| [Secrets & git conventions](docs/secrets.md) | template vs. live files, `.gitignore` rules |
| [Gaps](docs/gaps.md) | known rough edges |
