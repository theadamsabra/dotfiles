# Secrets & git conventions

Pattern: **track the template, ignore the live file.**

| Path | Status | Notes |
|------|--------|-------|
| `env/.env.example` | tracked | template |
| `env/.env` | ignored | real keys (stowed to `~/.env`) |
| `.pi/agent/models.json.example` | tracked | template |
| `.pi/agent/models.json` | ignored | generated; contains real keys |
| `.pi/agent/sessions/` | ignored | live JSONL logs |
| `.bashrc` | ignored | zsh-only machine |
| `.pi/agent/auth.json`, `models-store.json` | **tracked** (currently empty `{}`) | **not** gitignored — if PI ever stores credentials there, gitignore them first |
| `.zshrc`, `README.md` | untracked | in the working tree, not committed |

The base of `.gitignore` is the stock Python template; only the custom block at the bottom applies to this repo (it re-includes `env/` after the template's `env/` ignore, then re-ignores `env/.env`).
