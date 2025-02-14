local status, lualine = pcall(require, "lualine")
if not status then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "powerline",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
            {'neo-tree filesystem [1]'},
            },
            winbar = {
              {'neo-tree filesystem [1]'},
            },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 500,
            tabline = 500,
            winbar = 500,
        },
    },
    sections = {
        lualine_a = { "filename" },
        lualine_b = { "mode"},
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
      lualine_a = {{ "branch"}},
      lualine_b = {
        { "buffers", mode = 2, buffers_color={
          active='StatusLine', inactive='StatusLineNC' 
          }
        }
      },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {'neo-tree'},
})
