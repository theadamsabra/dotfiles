# Editor (`.config/nvim/`)

`init.lua` bootstraps lazy.nvim, then loads `lua/vim-config.lua` (options) and one lazy spec per plugin from `lua/plugins/`. Versions are pinned in `lazy-lock.json`.

Options: leader `Space`, 2-space indents, `cursorline`, relative line numbers.

| Area | Plugin(s) |
|------|-----------|
| Dashboard | alpha-nvim (custom ASCII banner; `f` find, `r` recent, `q` quit) |
| Theme | kanagawa.nvim (`dragon` variant) |
| Statusline | lualine.nvim |
| File explorer | neo-tree.nvim (v3.x) |
| LSP | lsp-zero.nvim (v3.x) + nvim-lspconfig + mason.nvim + mason-lspconfig.nvim |
| Completion | nvim-cmp + LuaSnip (+ cmp-nvim-lsp) |
| Fuzzy finding | telescope.nvim (ripgrep-backed, hidden files included) |
| Syntax | nvim-treesitter (lua, python, markdown) |
| Debugging | nvim-dap + nvim-dap-ui + nvim-dap-python |

Mason auto-installs `basedpyright` (custom analysis settings); `lua_ls` uses lsp-zero's nvim config. DAP picks the venv python when one is found (`$VIRTUAL_ENV` or a nearby `.venv`), else `python3`, and runs `debugpy.adapter`.

## Keybindings

Leader = `Space`.

| Keys | Action |
|------|--------|
| `<Space>k` | LSP hover docs |
| `<Space>ff` / `fg` / `fb` | telescope: find files / live grep / buffers |
| `<C-n>` / `<C-b>` | neo-tree: reveal current file / close |
| `Tab` / `S-Tab` | cycle completion items / snippet jumps |
| `<Space>db` `dn` `di` `do` `dc` `dt` `du` | DAP: toggle breakpoint, step over, step into, step out, continue, terminate, toggle DAP UI |
