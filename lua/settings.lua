local global = vim.g
local o = vim.o

vim.scriptencoding = "utf-8"

-- Map <leader>

global.mapleader = " "
global.maplocalleader = " "

-- Nerdfonts
--
global.have_nerd_fonts = true

-- Editor options

o.number = true -- Print the line number in front of each line
o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "utf-8" -- Sets the character encoding used inside Vim.
o.fileencoding = "utf-8" -- Sets the character encoding for the file of this buffer.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitbelow = true -- When on, splitting a window will put the new window below the current one
o.termguicolors = true
o.showmode = false -- It is on the status line already

vim.wo.foldmethod = "indent"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

-- No folds in Telescope results
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

-- Vimspector options
vim.cmd([[
  let g:vimspector_sidebar_width = 85
  let g:vimspector_bottombar_height = 15
  let g:vimspector_terminal_maxwidth = 70
  let g:python3_host_prog = '~/.config/nvim/venv/bin/python3'
]])

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
--vim.lsp.set_log_level("debug")
vim.g.rustfmt_autosave = 0
--
--Sync clipboard with system clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
