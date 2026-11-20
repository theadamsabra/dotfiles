# PI agent (`.pi/agent/`)

A single local OpenAI-compatible server serves two providers on two ports; `settings.json` makes `orchestrator` the default provider (model `local/qwen`, theme dark):

| Provider | Port | Used by |
|----------|------|---------|
| `subagent` | `$PI_SUBAGENT_PORT` | subagents (researcher, scout, worker) |
| `orchestrator` | `$PI_ORCHESTRATOR_PORT` | the main agent |

Both speak `openai-completions` to `local/qwen` on the shared `PI_MODEL_HOST`, each with its own API key.

| Env var (in `~/.env`) | Meaning |
|-----------------------|---------|
| `PI_MODEL_HOST` | Host of the model server |
| `PI_SUBAGENT_PORT` / `PI_SUBAGENT_API_KEY` | Subagent provider port / key |
| `PI_ORCHESTRATOR_PORT` / `PI_ORCHESTRATOR_API_KEY` | Orchestrator provider port / key |

## Config generation

On every shell start, `.zshrc` (if the template exists) loads `~/.env` and seds the five `$PI_*` placeholders in `models.json.example` into the live `models.json`. That file lives in the repo and is reached at `~/.pi/agent/models.json` through the [bootstrap symlink](bootstrap.md).

> **Gotcha:** before substituting, the pipeline copies each API key to a temp variable with any literal `|` escaped to `\|` (the sed delimiter). If you edit this block in `.zshrc`, keep the escaping.

## Interactive subagents

`extensions/interactive-subagents/` is a TypeScript extension that runs subagents in tmux panes, with a TUI status line (`config.json`: `status.enabled`), a `safe_bash` tool, and a `pi-auto-exit` hook plugin for pi-spawned Claude sessions. Agent definitions:

| Agent | Model | Thinking | Tools |
|-------|-------|----------|-------|
| researcher | `subagent/local/qwen` | medium | web_search, web_fetch, safe_bash |
| scout | `subagent/local/qwen` | low | read, grep, find, ls |
| worker | `subagent/local/qwen` | high | read, write, edit, bash, web_search, web_fetch (may spawn scout/researcher) |
