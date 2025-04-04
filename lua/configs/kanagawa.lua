local status, kanagawa = pcall(require, "kanagawa")

if not status then
  print("‼ Tried loading kanagawa ... unsuccessfully.")
    return
end

kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = true, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "wave", -- Load "default" theme or the experimental "light" theme
    background = {
      dark = "wave"
    }
})

vim.cmd [[colorscheme kanagawa-wave]]
