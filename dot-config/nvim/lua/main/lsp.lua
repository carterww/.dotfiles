local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border="single"}) end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=1, float=true}) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=-1, float=true}) end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

local lsp_servers = {
    clangd = require("main.lsp.clangd"), -- pacman (clang or llvm)
    cssls = {},                          -- npm (vscode-langservers-extracted)
    eslint = {},                         -- npm (vscode-langservers-extracted)
    html = {},                           -- npm (vscode-langservers-extracted)
    jsonls = {},                         -- npm (vscode-langservers-extracted)
    lua_ls = require("main.lsp.lua_ls"), -- pacman (lua-language-server)
    pyright = {},                        -- pacman (pyright)
    rust_analyzer = {},                  -- rustup (rust_analyzer)
    texlab = {},                         -- pacman (texlab)
    ts_ls = {},                          -- npm (typescript & typescript-language-server)
    hls = {},                            -- ghcup
}

for name, cfg in pairs(lsp_servers) do
    cfg.capabilities = vim.tbl_deep_extend("force", cmp_capabilities, cfg.capabilities or {})
    lspconfig[name].setup(cfg)
end
