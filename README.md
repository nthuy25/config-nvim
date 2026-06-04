<p align="center">
  <img src="assets/alpha.png" alt="config-nvim — Neovim configuration banner" width="100%">
</p>

<p align="center">
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white" alt="Neovim"></a>
  <a href="https://www.lua.org/"><img src="https://img.shields.io/badge/Lua-2C2D72?style=flat&logo=lua&logoColor=white" alt="Lua"></a>
  <a href="https://github.com/folke/lazy.nvim"><img src="https://img.shields.io/badge/plugin%20manager-lazy.nvim-6272a4?style=flat" alt="lazy.nvim"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green?style=flat" alt="MIT License"></a>
</p>

# Neovim configuration (`config-nvim`)

A modular Neovim setup written in Lua, managed with [lazy.nvim](https://github.com/folke/lazy.nvim). It focuses on a fast editing workflow: LSP, Telescope, Neo-tree (floating), Git tooling, formatting with Conform, and a Dracula-based UI—with extra niceties for Ruby on Rails (vim-rails + a custom routes helper).

---

## Preview

| Neo-tree preview | Telescope find file preview |
| :---: | :---: |
| ![Stylized Neo-tree preview](assets/neo-tree.png) | ![Stylized Telescope find file preview](assets/telescope.png) |

---

## Features

- **Plugin management:** lazy.nvim with a lockfile (`lazy-lock.json`).
- **Theme:** Custom Dracula palette (`#131313` background) via [dracula.nvim](https://github.com/Mofiqul/dracula.nvim) + centralized colors in `lua/core/colors.lua` (Neo-tree, Lualine, Noice, Bufferline).
- **LSP & completion:** `nvim-lspconfig`, Mason, `nvim-cmp`, LuaSnip, Fidget.
- **Navigation:** Telescope (with `fzf-native` when `make` is available), `which-key`, vim-tmux-navigator.
- **UI:** alpha-nvim dashboard, bufferline, lualine, neo-tree (float), noice, indent-blankline.
- **Editing:** Treesitter, nvim-autopairs, nvim-ts-autotag, conform.nvim, comment toggles via todo-comments, nvim-colorizer.
- **Git:** gitsigns, vim-fugitive, vim-rhubarb, lazygit.nvim.
- **Sessions:** rmagatti/auto-session (restore last session, autosave).
- **Rails / Ruby:** vim-rails; `<leader>rr` runs a custom helper to show routes for the current controller (`lua/customs/show-rails-route.lua`).
- **Other:** toggleterm, vim-sleuth; **auto-save on `InsertLeave`** when the buffer is modified (see `init.lua`).

Per-language LSP tweaks live under [`lua/plugins/lsp-configs/`](lua/plugins/lsp-configs/) (TypeScript, Tailwind, Ruby LSP, YAML, Docker, Ansible, Bash, Markdown, Nginx, SQL, HTML, JSON, CSS, etc.).

---

## Repository layout

```
init.lua
lua/
  core/
    colors.lua       # Single source of truth for the color palette
    keymaps.lua      # Global keymaps, diagnostics, format
    options.lua      # Options (clipboard, tabs, folds, …)
  customs/
    show-buffers.lua # Telescope buffer popup (<leader>fb)
    show-rails-route.lua
  plugins/
    *.lua            # Plugin specs & config
    lsp-configs/     # Per-tool LSP settings
lazy-lock.json
assets/              # README images (banner + previews)
```

- **`init.lua`:** Bootstraps lazy.nvim, loads core modules, registers plugins and custom autocmds.
- **`lua/core/`:** Editor options and mappings shared across the config.
- **`lua/plugins/`:** One file per concern (or small groups); LSP overrides in `lsp-configs/`.
- **`lua/customs/`:** Small Lua utilities used from `init.lua` or keymaps.

---

## Requirements

- **Neovim** 0.9+ recommended (uses `vim.lsp` APIs and Lua stdlib).
- A **Nerd Font** in the terminal for icons (web-devicons, bufferline, etc.).
- **Git**, **curl** or system tools as needed for Mason/LSP binaries.
- Optional: **`make`** for building `telescope-fzf-native`; **`lazygit`** on `$PATH` for the LazyGit integration.

---

## Installation

1. **Clone** into your config directory (backup any existing `~/.config/nvim` first):

   ```sh
   git clone https://github.com/chickenHuy/config-nvim.git ~/.config/nvim
   ```

2. **Start Neovim.** lazy.nvim bootstraps and installs plugins on first run.

3. **Mason / LSP tools:** Run `:Mason` to install language servers and formatters you need.

4. **Optional:** Install host tools (Node, Ruby, Python, etc.) required by specific servers—see each file under `lua/plugins/lsp-configs/`.

---

## Usage highlights

| Topic | Keys / notes |
| --- | --- |
| **Neo-tree** | `\` reveal current file; `<leader>nt` toggle float + reveal; `<leader>nb` buffers; `<leader>ng` git status |
| **Telescope** | `<leader>ff` files; `<leader>fg` live grep; `<leader><leader>` buffers; `<leader>f.` recent files; `<leader>/` fuzzy find in buffer |
| **Buffers (BufferLine)** | `<Tab>` / `<S-Tab>` next/prev; `<leader>bd` delete; `<leader>bc` close others; `<leader>bp` / `<leader>bn` cycle |
| **LSP (buffer-local)** | `<leader>gd` definition; `<leader>gi` implementation; `<leader>gD` declaration; `<leader>gt` type def; `<leader>gs` / `<leader>gw` symbols; `<leader>gr` rename; `<leader>ga` code action; `<leader>th` toggle inlay hints |
| **Diagnostics** | `<leader>dp` / `<leader>dn` prev/next; `<leader>dt` float; `<leader>dl` loclist |
| **Format** | `<leader>fm` (Conform) |
| **Git (LazyGit)** | `<leader>lt` open; `<leader>lc` current file; `<leader>lf` / `<leader>lF` filters |
| **Rails** | `<leader>rr` routes for current controller |
| **Custom** | `<leader>fb` buffer picker popup |

Press `<leader>` and pause to see **which-key** hints (leader is **space**).

---

## Color theme

This config uses a **custom Dracula-style palette** aligned with the terminal colors below—not the default dracula.nvim background (`#282A36`). All UI plugins read from one module: [`lua/core/colors.lua`](lua/core/colors.lua).

### Palette

| Role | Hex | ANSI / notes |
| --- | --- | --- |
| Background | `#131313` | Editor, active tab, popups |
| Foreground | `#FCFCFC` | Default text |
| Selection bg / fg | `#252525` / `#50FA7B` | Visual, PmenuSel |
| Cursor / cursor text | `#FCFCFC` / `#131313` | |
| Surface | `#1b1b1b` | Statusline, cursor line, Lualine sections |
| Menu | `#21222C` | Pmenu, Neo-tree panels (color0) |
| Comment | `#6272A4` | Line numbers, muted text (color8) |
| Red / Green / Yellow | `#FF5555` / `#50FA7B` / `#F1FA8C` | |
| Purple / Pink / Cyan | `#BD93F9` / `#FF79C6` / `#8BE9FD` | |
| Bright variants | `#FF6E6E` … `#FFFFFF` | ANSI 9–15 |

Terminal colors are applied with `g.terminal_color_*` in `colors.apply_terminal()` so Neovim terminals (e.g. toggleterm) match the same scheme.

### Architecture

```
Terminal / user palette
        ↓
lua/core/colors.lua          ← edit colors here only
        ↓
┌─────────────────────┬──────────────────────────┬─────────────────────┐
│ colortheme.lua      │ patch + apply_*()        │ plugin configs      │
│ dracula + overrides │ (neo-tree, noice)        │ lualine, bufferline │
└─────────────────────┴──────────────────────────┴─────────────────────┘
```

| File | Purpose |
| --- | --- |
| [`lua/core/colors.lua`](lua/core/colors.lua) | Palette constants; `dracula()`, `apply_terminal()`, `apply_neotree()`, `apply_noice()`, `bufferline()`, `lualine()` |
| [`lua/plugins/colortheme.lua`](lua/plugins/colortheme.lua) | Loads Dracula with `colors.dracula()` and **overrides** (Normal, Telescope, cmp, BufferLine*, Noice*, …) |
| [`lua/plugins/neotree.lua`](lua/plugins/neotree.lua) | Patches neo-tree `highlights.setup` + refresh on window open |
| [`lua/plugins/noice.lua`](lua/plugins/noice.lua) | Patches noice highlights; cmdline/search popup uses `NoiceCmdlinePopup` |
| [`lua/plugins/lualine.lua`](lua/plugins/lualine.lua) | `theme = colors.lualine()` (not the built-in `dracula` theme) |
| [`lua/plugins/bufferline.lua`](lua/plugins/bufferline.lua) | `highlights` function merges `colors.bufferline()` into plugin defaults |

`colortheme.lua` loads first (`lazy = false`, `priority = 1000`).

### Per-plugin behavior

**Neo-tree** — Neo-tree resets highlights with hardcoded colors on setup and `ColorScheme`. Fix: `patch_neotree_highlights()` wraps `highlights.setup` and re-applies `apply_neotree()` with `highlight!`. Events on window open / buffer enter keep float `winhighlight` in sync.

**Lualine** — Built-in Lualine theme `dracula` uses `#282a36`. Fix: custom theme table from `colors.lualine()` (mode colors: purple / green / pink / yellow / cyan on `#1b1b1b`).

**Noice** (`/` search popup) — Noice links `NoiceCmdlinePopup` to `Normal` after load. Fix: `patch_noice_highlights()` + explicit `NoiceCmdlinePopup` background `#131313` in `cmdline_popup` winhighlight.

**Bufferline** — Derives colors from the colorscheme; icon highlights inherit **parent** `bg` (`buffer`, `buffer_visible`, `background`). Unselected tabs use `#131313`; tab bar fill uses `#21222C`. Highlights are merged via:

```lua
highlights = function(defaults)
  return vim.tbl_deep_extend("force", defaults.highlights, colors.bufferline())
end
```

(Only `defaults.highlights` must be merged—not the full defaults table.)

### Change colors

1. Edit hex values in [`lua/core/colors.lua`](lua/core/colors.lua).
2. Restart Neovim, or reload:

   | Plugin | Command |
   | --- | --- |
   | Neo-tree | `:lua require("core.colors").apply_neotree()` |
   | Noice | `:lua require("core.colors").apply_noice()` |
   | Bufferline | `:BufferlineReload` |
   | Full theme | `:colorscheme dracula` |

3. For a new plugin that overrides highlights after colorscheme, add groups to `colortheme.lua` `overrides` and/or an `apply_*()` + patch pattern like neo-tree/noice.

---

## Customization

- **Colors:** [`lua/core/colors.lua`](lua/core/colors.lua) (palette); [`lua/plugins/colortheme.lua`](lua/plugins/colortheme.lua) (Dracula overrides).
- **Plugins:** Add or edit files under [`lua/plugins/`](lua/plugins/).
- **LSP:** Extend [`lua/plugins/lsp.lua`](lua/plugins/lsp.lua) and [`lua/plugins/lsp-configs/`](lua/plugins/lsp-configs/).
- **Keys & options:** [`lua/core/keymaps.lua`](lua/core/keymaps.lua), [`lua/core/options.lua`](lua/core/options.lua).

---

## Updating plugins

Inside Neovim:

```
:Lazy update
```

---

## License

This project is released under the [MIT License](LICENSE). You may use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, subject to the conditions in that file.

Third-party plugins and tools installed by lazy.nvim or Mason remain under their respective licenses; this license applies to the configuration and Lua files in this repository only.
