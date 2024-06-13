-- 🌑init.lua

require("settings")
require("plugins")
require("maps")

-- colorscheme config: kanagawa
-- local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa-wave")
else
	return
end

