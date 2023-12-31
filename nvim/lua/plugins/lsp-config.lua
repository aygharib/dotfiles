return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({
                capabilites = capabilities,
            })
            lspconfig.html.setup({
                capabilites = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilites = capabilities,
            })
            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--fallback-style=Google",
                    "--all-scopes-completion",
                    "--clang-tidy",
                    "--log=error",
                    "--suggest-missing-includes",
                    "--cross-file-rename",
                    "--completion-style=detailed",
                    "--pch-storage=memory", -- could also be disk
                    "--folding-ranges",
                    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
                    "--offset-encoding=utf-16", --temporary fix for null-ls
                    "--header-insertion-decorators",
                    "--header-insertion=iwyu",
                },
                capabilites = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
            })

            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
        end,
    },
}
