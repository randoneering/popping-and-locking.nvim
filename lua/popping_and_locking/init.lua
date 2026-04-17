local M = {}

local defaults = {
  transparent = false,
  italic_comments = true,
  overrides = {},
}

M.config = vim.deepcopy(defaults)

local p = {
  bg = "#181921",
  bg_alt = "#1d2021",
  fg = "#ebdbb2",
  muted = "#a89984",
  gray = "#928374",
  red = "#cc241d",
  red_bright = "#f42c3e",
  green = "#98971a",
  green_bright = "#b8bb26",
  yellow = "#d79921",
  yellow_bright = "#fabd2f",
  blue = "#458588",
  blue_bright = "#99c6ca",
  magenta = "#b16286",
  magenta_bright = "#d3869b",
  cyan = "#689d6a",
  cyan_bright = "#7ec16e",
}

local function highlights(config)
  local bg = config.transparent and "NONE" or p.bg

  local h = {
    -- UI / Editor
    Normal = {fg = p.fg, bg = bg},
    NormalFloat = {fg = p.fg, bg = bg},
    FloatBorder = {fg = p.gray, bg = bg},
    SignColumn = {bg = bg},
    Cursor = {fg = p.bg, bg = "#c7c7c7"},
    Directory = {fg = p.blue},
    LineNr = {fg = p.gray, bg = bg},
    CursorLineNr = {fg = p.fg, bg = bg, bold = true},
    CursorLine = {bg = p.bg_alt},
    ColorColumn = {bg = p.bg_alt},
    Visual = {bg = "#4a4744"},
    Search = {bg = "#896b28"},
    IncSearch = {fg = p.bg, bg = p.red_bright},
    MatchParen = {fg = p.yellow_bright, bold = true},
    Pmenu = {fg = p.fg, bg = p.bg_alt},
    PmenuSel = {fg = p.fg, bg = "#1a1c21"},
    WinSeparator = {fg = p.gray},
    StatusLine = {fg = p.fg, bg = p.bg_alt},
    StatusLineNC = {fg = p.muted, bg = p.bg_alt},
    VertSplit = {fg = p.gray},
    NonText = {fg = p.gray},
    Folded = {fg = p.gray, bg = p.bg_alt},
    FoldColumn = {fg = p.gray, bg = bg},
    LspInlayHint = {fg = p.red_bright},

    -- Vim syntax groups
    Comment = {fg = p.blue, italic = config.italic_comments},
    Constant = {fg = p.magenta_bright},
    String = {fg = p.yellow},
    Character = {fg = p.yellow},
    Number = {fg = p.magenta_bright},
    Boolean = {fg = p.magenta_bright},
    Identifier = {fg = p.fg},
    Function = {fg = p.gray},
    Statement = {fg = p.red_bright},
    Operator = {fg = p.green},
    Keyword = {fg = p.red_bright},
    PreProc = {fg = p.yellow},
    Type = {fg = p.yellow_bright},
    Special = {fg = p.blue},
    Delimiter = {fg = p.green},
    Tag = {fg = p.blue},
    Title = {fg = p.blue, bold = true},
    Todo = {fg = p.red_bright, bold = true},
    Label = {fg = p.blue},

    -- Diagnostics
    DiagnosticError = {fg = p.red},
    DiagnosticWarn = {fg = p.yellow},
    DiagnosticInfo = {fg = p.blue},
    DiagnosticHint = {fg = p.red_bright},
    DiagnosticUnderlineError = {undercurl = true, sp = p.red},
    DiagnosticUnderlineWarn = {undercurl = true, sp = p.yellow},
    DiagnosticUnderlineInfo = {undercurl = true, sp = p.blue},
    DiagnosticUnderlineHint = {undercurl = true, sp = p.red_bright},

    -- Diff / Git
    DiffAdd = {fg = p.green, bg = "#38391f"},
    DiffChange = {fg = p.yellow, bg = "#483921"},
    DiffDelete = {fg = p.red, bg = "#451c20"},
    DiffText = {fg = p.blue, bg = "#23343b"},
    GitSignsAdd = {fg = p.green},
    GitSignsChange = {fg = p.yellow},
    GitSignsDelete = {fg = p.red},

    -- Treesitter: comments
    ["@comment"] = {link = "Comment"},
    ["@comment.documentation"] = {fg = p.muted, italic = config.italic_comments},

    -- Treesitter: keywords & operators
    ["@keyword"] = {fg = p.red_bright},
    ["@operator"] = {fg = p.green},
    ["@preproc"] = {fg = p.yellow},
    ["@label"] = {fg = p.blue},
    ["@attribute"] = {fg = p.green},

    -- Treesitter: strings
    ["@string"] = {fg = p.yellow},
    ["@string.escape"] = {fg = p.yellow},
    ["@string.regexp"] = {fg = p.yellow},
    ["@string.special"] = {fg = p.blue},
    ["@string.special.symbol"] = {fg = p.magenta_bright},
    ["@string.special.path"] = {fg = p.blue},
    ["@string.special.path.nix"] = {fg = p.blue},
    ["@string.special.nix"] = {fg = p.blue},

    -- Treesitter: literals
    ["@number"] = {fg = p.magenta_bright},
    ["@boolean"] = {fg = p.magenta_bright},

    -- Treesitter: functions & types
    ["@function"] = {fg = p.gray},
    ["@function.method"] = {fg = p.cyan},
    ["@constructor"] = {fg = p.yellow_bright},
    ["@type"] = {fg = p.yellow_bright},
    ["@property"] = {fg = p.blue},
    ["@variable"] = {fg = p.fg},
    ["@variable.builtin"] = {fg = p.magenta_bright},

    -- Treesitter: punctuation
    ["@punctuation"] = {fg = p.green},
    ["@punctuation.bracket"] = {fg = p.green},
    ["@punctuation.delimiter"] = {fg = p.green},
    ["@punctuation.special"] = {fg = p.red_bright},

    -- Treesitter: tags (HTML/JSX)
    ["@tag"] = {fg = p.blue},
    ["@tag.attribute"] = {fg = p.green},
    ["@tag.delimiter"] = {fg = p.green},

    -- Treesitter: markup
    ["@markup.heading"] = {fg = p.blue, bold = true},
    ["@markup.italic"] = {fg = p.blue, italic = true},
    ["@markup.strong"] = {fg = p.magenta_bright, bold = true},
    ["@markup.raw"] = {fg = p.green_bright},
    ["@markup.link"] = {fg = p.blue, italic = true, bold = true},
    ["@markup.link.url"] = {fg = p.cyan, underline = true},
    ["@markup.list"] = {fg = p.red_bright},
    ["@text.uri"] = {fg = p.cyan, underline = true},

    -- LSP semantic tokens
    ["@lsp.type.enum"] = {fg = p.blue},
    ["@lsp.type.enumMember"] = {fg = p.blue},
    ["@lsp.type.string.nix"] = {fg = p.blue},
    ["@lsp.typemod.string.nix"] = {fg = p.blue},
    ["@lsp.type.operator.nix"] = {fg = p.green},
    ["@lsp.typemod.operator.nix"] = {fg = p.green},

    -- Nix-specific treesitter
    ["@punctuation.delimiter.nix"] = {fg = p.green},
    ["@operator.nix"] = {fg = p.green},
    ["@punctuation.special.nix"] = {fg = p.red_bright},
    ["@punctuation.bracket.nix"] = {fg = p.green},

    -- Nix legacy syntax
    nixPath = {fg = p.blue},
    nixPathDelimiter = {fg = p.blue},
    nixOperator = {fg = p.green},
    nixParen = {fg = p.green},
    nixListBracket = {fg = p.green},
    nixInterpolation = {fg = p.fg},
    nixInterpolationDelimiter = {fg = p.red_bright},
    nixInterpolationParam = {fg = p.fg},
  }

  return vim.tbl_deep_extend("force", h, config.overrides or {})
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

function M.load()
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.cmd("highlight clear")
  vim.o.termguicolors = true
  vim.g.colors_name = "popping_and_locking"

  for group, value in pairs(highlights(M.config)) do
    vim.api.nvim_set_hl(0, group, value)
  end

  vim.g.terminal_color_0 = "#1d2021"
  vim.g.terminal_color_1 = "#cc241d"
  vim.g.terminal_color_2 = "#98971a"
  vim.g.terminal_color_3 = "#d79921"
  vim.g.terminal_color_4 = "#458588"
  vim.g.terminal_color_5 = "#b16286"
  vim.g.terminal_color_6 = "#689d6a"
  vim.g.terminal_color_7 = "#a89984"
  vim.g.terminal_color_8 = "#928374"
  vim.g.terminal_color_9 = "#f42c3e"
  vim.g.terminal_color_10 = "#b8bb26"
  vim.g.terminal_color_11 = "#fabd2f"
  vim.g.terminal_color_12 = "#99c6ca"
  vim.g.terminal_color_13 = "#d3869b"
  vim.g.terminal_color_14 = "#7ec16e"
  vim.g.terminal_color_15 = "#ebdbb2"
end

return M
