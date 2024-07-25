-- 📂lua/🌑maps.lua

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<leader>ff", telescope.find_files)
    map("n", "<leader>fg", telescope.live_grep)
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
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

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
map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
map('n', "Dw", ":call vimspector#AddWatch()<cr>")
map('n', "De", ":call vimspector#Evaluate()<cr>")

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
map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")


