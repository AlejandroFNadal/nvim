-- 📂lua/📂configs/🌑lsp.lua

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local opts = { noremap = true, silent = true }
    buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) 
    buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)   
    buf_set_keymap(bufnr, 'n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'cf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript
nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Tailwind
nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- python
nvim_lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

