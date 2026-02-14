# popping-and-locking.nvim

A Neovim colorscheme based on the Popping and Locking palette used in the Zed theme.

## Screenshot

Add a screenshot at `./screenshots/main.png` and uncomment this line:

<!-- ![popping-and-locking.nvim screenshot](./screenshots/main.png) -->

## Quick start

```lua
require("popping_and_locking").setup({})
vim.cmd.colorscheme("popping_and_locking")
```

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

## Configuration

```lua
require("popping_and_locking").setup({
  transparent = false,
  italic_comments = true,
  overrides = {
    -- Example:
    -- Normal = { bg = "NONE" },
  },
})
```

### Options

- `transparent` (`boolean`, default `false`): Make `Normal` and related UI backgrounds transparent.
- `italic_comments` (`boolean`, default `true`): Use italic style for comments.
- `overrides` (`table`, default `{}`): Override any highlight groups, for example `Normal`, `Comment`, or `@keyword`.

## Manual install (single file)

If you only want the colorscheme file, copy `colors/popping_and_locking.lua` to:

`~/.config/nvim/colors/popping_and_locking.lua`

Then load it:

```lua
vim.o.termguicolors = true
vim.cmd.colorscheme("popping_and_locking")
```

## Troubleshooting

- If Neovim says it cannot find the colorscheme, check that the file is named `popping_and_locking.lua` and is in a `colors/` directory on your runtime path.
- If colors look wrong, confirm true color support is enabled with `vim.o.termguicolors = true`.
- If a plugin overrides highlights after startup, re-apply your overrides in that plugin's setup or in a `ColorScheme` autocmd.

## Credits

- Original palette and theme direction: [randoneering/popping-and-locking-zed-theme](https://github.com/randoneering/popping-and-locking-zed-theme)
- Neovim port: this repository
