# Bootstrap (new machine)

Prereqs: Homebrew, then `brew install stow tmux neovim`; a nerd font (tmux status bar); Node + the [PI agent](https://pi.dev); `pip install debugpy` (Neovim Python debugging).

```bash
git clone git@github.com:theadamsabra/dotfiles.git ~/dotfiles
cd ~/dotfiles
cp env/.env.example env/.env        # fill in the five PI_* values
mkdir -p ~/.config ~/.pi/agent
stow -t ~ env .config               # -> ~/.env, ~/.env.example, ~/.config/nvim
ln -s dotfiles/.tmux.conf ~/.tmux.conf
ln -s ../../dotfiles/.pi/agent/settings.json ~/.pi/agent/settings.json
ln -s ../../dotfiles/.pi/agent/models.json  ~/.pi/agent/models.json
ln -s ../../dotfiles/.pi/agent/extensions   ~/.pi/agent/extensions
```

- Stow handles *directory* packages only (`.tmux.conf` is a plain file — link it by hand).
- `~/.pi/agent/` is PI's own runtime directory, so its tracked config is linked in file-by-file instead of stowing `.pi`.
- The first `nvim` run is self-installing: lazy.nvim clones itself, installs the plugins pinned in `lazy-lock.json`, Mason ensures `basedpyright`, treesitter builds its parsers.
- Until the `.zshrc` pipeline path is fixed ([Gaps](gaps.md)), generate `~/dotfiles/.pi/agent/models.json` once by hand: run the sed pipeline from `~/.zshrc` (described in [PI agent — Config generation](pi-agent.md#config-generation)) with the `~/.dotfiles` prefix replaced by `~/dotfiles`.
