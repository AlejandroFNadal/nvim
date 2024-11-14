-- 🌑init.lua

require("settings")
require("plugins")
require("maps")

-- colorscheme config: kanagawa
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
  print("Loaded colorscheme")
	vim.cmd[[colorscheme kanagawa-wave]]
else
  print("Error loading colorscheme")
	return
end
