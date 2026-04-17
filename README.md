# popping-and-locking.nvim

A Neovim colorscheme based on the Popping and Locking palette from the Zed theme.

This repo contains a small theme plugin with:

- a setup module at `lua/popping_and_locking/init.lua`
- a colorscheme entrypoint at `colors/popping_and_locking.lua`

## What It Covers

The theme currently defines highlight groups for:

- core editor UI like `Normal`, floating windows, statusline, line numbers, search, folds, and popup menus
- Vim syntax groups like comments, strings, keywords, functions, types, and delimiters
- diagnostics and diagnostic undercurls
- diff and Git signs groups
- Treesitter groups for comments, strings, numbers, functions, variables, tags, markup, and punctuation
- LSP semantic tokens
- Nix-specific Treesitter and legacy syntax groups
- terminal colors via `vim.g.terminal_color_0` through `vim.g.terminal_color_15`

## Install

### lazy.nvim

```lua
{
  "randoneering/popping-and-locking.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("popping_and_locking").setup({
      transparent = false,
      italic_comments = true,
      overrides = {},
    })
    vim.cmd.colorscheme("popping_and_locking")
  end,
}
```

### packer.nvim

```lua
use {
  "randoneering/popping-and-locking.nvim",
  config = function()
    require("popping_and_locking").setup({})
    vim.cmd.colorscheme("popping_and_locking")
  end,
}
```

## Quick Start

Use the defaults:

```lua
vim.cmd.colorscheme("popping_and_locking")
```

Or configure it first:

```lua
require("popping_and_locking").setup({
  transparent = false,
  italic_comments = true,
})

vim.cmd.colorscheme("popping_and_locking")
```

## Configuration

`setup()` accepts three options:

- `transparent` (`boolean`, default `false`): sets the main background groups to `NONE`
- `italic_comments` (`boolean`, default `true`): toggles italics for `Comment` and related comment groups
- `overrides` (`table`, default `{}`): merges custom highlight definitions over the built-in theme

Example:

```lua
require("popping_and_locking").setup({
  transparent = true,
  italic_comments = false,
  overrides = {
    NormalFloat = { bg = "#1d2021" },
    Comment = { fg = "#928374", italic = false },
    ["@function"] = { fg = "#7ec16e" },
  },
})
```

## How It Loads

`colors/popping_and_locking.lua` calls:

```lua
require("popping_and_locking").load()
```

When `load()` runs, it:

- clears existing highlights
- resets syntax when needed
- enables `termguicolors`
- sets `vim.g.colors_name`
- applies the generated highlight table
- sets the 16 terminal colors

## Manual Install

If you do not want to use a plugin manager, place this repo on your runtime path so both of these files are available:

- `lua/popping_and_locking/init.lua`
- `colors/popping_and_locking.lua`

Then load the colorscheme with:

```lua
vim.cmd.colorscheme("popping_and_locking")
```

Copying only `colors/popping_and_locking.lua` is not enough, because it requires the Lua module under `lua/popping_and_locking/`.

## Troubleshooting

- If Neovim cannot find the colorscheme, make sure the repo is on your runtime path and that `colors/popping_and_locking.lua` exists.
- If Neovim errors on `require("popping_and_locking")`, make sure `lua/popping_and_locking/init.lua` is also present.
- If colors look wrong, check that your terminal supports true color. The theme enables `termguicolors` when it loads.
- If another plugin changes highlights after startup, use `overrides` or re-apply your custom highlights in a `ColorScheme` autocmd.

## Credits

- Original palette and theme direction: [randoneering/popping-and-locking-zed-theme](https://github.com/randoneering/popping-and-locking-zed-theme)
