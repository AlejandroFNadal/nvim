-- 📂lua/🌑maps.lua

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
  map("n", "<leader>fi", function()telescope.live_grep{ no_ignore = true, hidden=true} end)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>v", "<CMD>vsplit<CR>")
map("n", "<leader>h", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")
map("n", "<leader>bd", "<CMD>bp|bd#<CR>")
-- Jump to buffers
map("n", "<leader>1", "<CMD>LualineBuffersJump 1<CR>")
map("n", "<leader>2", "<CMD>LualineBuffersJump 2<CR>")
map("n", "<leader>3", "<CMD>LualineBuffersJump 3<CR>")
map("n", "<leader>4", "<CMD>LualineBuffersJump 4<CR>")
map("n", "<leader>5", "<CMD>LualineBuffersJump 5<CR>")
map("n", "<leader>6", "<CMD>LualineBuffersJump 6<CR>")
map("n", "<leader>7", "<CMD>LualineBuffersJump 7<CR>")
map("n", "<leader>8", "<CMD>LualineBuffersJump 8<CR>")
map("n", "<leader>9", "<CMD>LualineBuffersJump 9<CR>")


-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<Leader>rz", "<C-w>_<C-w>|", { desc = "full si[z]e" })
vim.keymap.set("n", "<Leader>rZ", "<C-w>=", { desc = "even si[Z]e" })

-- Vimspector
-- Vimspector
vim.cmd([[
  nmap <F9> <cmd>call vimspector#Launch()<cr>
  nmap <F6> <cmd>call vimspector#Pause()<cr>
  nmap <F5> <cmd>call vimspector#StepOver()<cr>
  nmap <F8> <cmd>call vimspector#Reset()<cr>
  nmap <F11> <cmd>call vimspector#StepOver()<cr>")
  nmap <F12> <cmd>call vimspector#StepOut()<cr>")
  nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
map("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
map("n", "Dw", ":call vimspector#AddWatch()<cr>")
map("n", "De", ":call vimspector#Evaluate()<cr>")

-- LSP
map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
map("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
map("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
map("n", "ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
map("n", "cr", "<CMD>lua vim.lsp.buf.rename()<CR>")
map("n", "cf", "<CMD>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>ne", "<CMD>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>d", "<CMD>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")

-- Colors
map("n", "<leader>b", "<CMD>colorscheme kanagawa-wave<CR>")

-- shift keys to the right for moving
-- nnoremap("j", "h")
-- nnoremap("k", "j")
-- nnoremap("l", "k")
-- nnoremap(";", "l")
