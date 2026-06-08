# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration (Lua), managed by [lazy.nvim](https://github.com/folke/lazy.nvim). It lives inside a larger GNU Stow dotfiles repo. The **git root is `~/.dotfiles`**, not this directory — symlinked into place as `~/.config/nvim`. This split matters for tooling that resolves a project root (see the luacheck HACK below).

## Commands

There is no build step — Neovim loads Lua at startup. Iterate by reloading nvim or `:Lazy reload <plugin>`.

- **Format Lua:** `stylua .` (config: `.stylua.toml` — 2 spaces, 120 col, double quotes, no call parens)
- **Lint Lua:** `luacheck . --config .luacheckrc` (only global allowed is `vim`)
- **Plugin management:** `:Lazy` (install/update/sync), `:Lazy reload <plugin>`
- **Tool/LSP/DAP install:** `:Mason`; ensured tools auto-install on startup via `mason-tool-installer`
- **Run a test:** `<leader>tn` (nearest), `<leader>tf` (file), `<leader>dt` (debug nearest) — via neotest
- Lua formatting/linting also runs in-editor: conform formats on save, none-ls provides luacheck diagnostics.

## Architecture

**Load order** (`init.lua`): bootstrap lazy.nvim → `require("lazy").setup("plugins")` → `options` → `autocmds` → `mappings` (deferred via `vim.schedule`, since mappings reference plugin modules like `dap`/`neotest` that must be loaded first).

**Plugin specs** live in `lua/plugins/*.lua`. Each file `return`s a lazy.nvim spec (table or list of tables). `lua/plugins/init.lua` holds shared dependency plugins (plenary, nui, web-devicons, etc.). Adding a new `lua/plugins/foo.lua` is enough to register it — no manual import list.

**Keymaps are centralized** in `lua/mappings.lua` (not scattered in plugin configs). Leader is `<space>`. Add new bindings here with a `desc` so which-key surfaces them.

### LSP / tooling pipeline

The toolchain is split across four cooperating files, all keyed by the same set of languages — keep them in sync when adding a language:

- `lua/plugins/lsp.lua` — `nvim-lspconfig`. Servers are declared in a `servers` table where `true` means "default config"; values are merged over shared `capabilities` + `on_attach` (which enables inlay hints). lspsaga provides the LSP UI (hover, finder, diagnostics jumps).
- `lua/plugins/mason.lua` — Mason + `mason-tool-installer`. `ensure_installed` lists every LSP/DAP/linter/formatter binary. Install is gated behind a **custom `User MasonReady` autocmd** fired after Mason setup, so the tool installer waits for Mason to be ready.
- `lua/plugins/conform.lua` — formatters per filetype, `format_on_save` with `lsp_fallback`. Frontend → `prettierd`, Lua → `stylua`, Python → `black`, etc.
- `lua/plugins/none-ls.lua` — linters as LSP diagnostics/code-actions. eslint_d and luacheck are **conditionally enabled** only when their config file exists in the project root (`utils.notify` reports skip/enable).

> **luacheck root HACK:** because the git root is `~/.dotfiles`, none-ls's root detection for this very config checks for `/nvim/.config/nvim/.luacheckrc` and passes `--config <root>/.luacheckrc` explicitly. If you change the dotfiles layout, update this in `none-ls.lua`.

### Testing & debugging

- `lua/plugins/neotest.lua` — adapters for jest, vitest, python (uses `./.venv/bin/python`), phpunit. Jest config is auto-discovered via `*.jest.config.*` glob.
- `lua/plugins/dap.lua` — nvim-dap + dap-ui (auto open/close on session events) + virtual text (censors values whose name/value matches `secret`/`api`). JS/TS uses `pwa-node` pointing at the Mason-installed `js-debug-adapter`, which **must be built manually after install** (see the build steps commented in the file). Python DAP is a TODO.

### Shared utilities

`lua/utils.lua` exposes `M.notify(title, msg, level)` — a thin `vim.notify` wrapper used across plugin configs for user-facing messages.

## Conventions

- Match `.stylua.toml`: 2-space indent, double quotes, no parens on single-string/table calls (`require "foo"`, `setup {}`).
- When adding language support, touch all four pipeline files (lsp, mason, conform, none-ls) plus neotest/dap if relevant.
- Don't commit from this directory expecting it to be the repo — `cd ~/.dotfiles` for git operations.
