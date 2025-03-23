return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd" } -- auto-install clangd
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            local on_attach = function(client, bufnr)
                -- vim.g.inlay_hints_visible = true
                -- vim.g.diagnostics_visible = true
                
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)    -- Go to definition
                vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)        -- Rename symbol
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)   -- Code actions
                vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)          -- Hover info
                vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)

--             vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
--             vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
--             vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
--             vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})
--             vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
--             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--             vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--             vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--             vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
--             vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
--             vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
--             vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            end

            lspconfig.clangd.setup({
                filetypes = { "c", "cpp" },
                on_attach = on_attach,
                root_dir = function(fname)
                    -- Ensure clangd detects the root of the project
                    return lspconfig.util.root_pattern("CMakeLists.txt", ".git")(fname) or vim.fn.getcwd()
                end,
                -- In the Neovim LSP configuration, cmd is a way to explicitly specify the command that should be used to start the language server
                -- The cmd table is used to pass arguments directly to the language server binary when it is launched
                -- Without this, clangd automatically uses the default `clangd` command without specifying any extra arguments
                -- With this setup, we can include which extra flags that could improve functionality like background indexing or better completion
                -- cmd = {
                --     "clangd",
                --     "--clang-tidy=true",                -- Enable clang-tidy for linting
                --     "--clang-tidy-checks=" ..
                --     table.concat({
                --         "bugprone-*",           -- Detects common bugs
                --         "cert-*",               -- Security best practices
                --         "clang-diagnostic-*",
                --         "clang-analyzer-*",
                --         "concurrency-*",        -- Detects thread-safety issues
                --         "cppcoreguidelines-*",  -- Enforces C++ Core Guidelines
                --         "misc-*",               -- General purpose linting checks
                --         "modernize-*",          -- Enforces C++11/14/17/20 best practices
                --         "performance-*",        -- Identifies slow code patterns
                --         "portability-*",        -- Ensures portability across compilers
                --         "readability-*",        -- Improves readability & maintainability
                --         -- "modernize-use-trailing-return-type",
                --         -- "-modernize-use-trailing-return-type", -- (Optional) Disable trailing return type enforcement
                --         -- "-readability-identifier-naming",      -- (Optional) Avoid strict naming convention enforcement
                --     }, ","),  -- Converts the table to a comma-separated string
                    
                --     "--completion-style=detailed", -- Better completion
                --     "--header-insertion=never",    -- Don't insert headers automatically
                --     "--all-scopes-completion=true", 

                --     --- settings for big codebases
                --     -- speed up indexing and reduce memory usage
                --     "--background-index",  -- Keep indexing in the background. in extreme cases where performance is a real problem this can be disabled
                --     -- "--limit-results=100",
                --     -- -- "--clang-tidy=false",

                --     -- handle large files efficiently
                --     -- "--limit-references=1000",
                --     -- "--limit-symbol-results=500",
                --     -- "--fallback-style=Google",

                --     -- extreme performance needed
                --     -- "--log=error",
                --     -- "--all-scopes-completion=false",
                --     -- "--pch-storage=memory", -- this seams to break clang-tidy
                --     -- "--sync-debounce=500", -- this seams to break clang-tidy -- can increase this for even better performance
                --     -- "--malloc-trim", -- this errors out
                -- },
            })
        end,
    },
}

-- return {
--     {
--         "williamboman/mason.nvim",
--         lazy = false,
--         config = function()
--             require("mason").setup()
--         end,
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         lazy = false,
--         opts = {
--             auto_install = true,
--         },
--     },
--     {
--         "neovim/nvim-lspconfig",
--         lazy = false,
--         config = function()
--             local capabilities = require("cmp_nvim_lsp").default_capabilities()
--             -- require("clangd_extensions.inlay_hints").setup_autocmd()
--             -- require("clangd_extensions.inlay_hints").set_inlay_hints()

--             local lspconfig = require("lspconfig")

--             lspconfig.clangd.setup({
--                 cmd = {
--                     "clangd",
--                     "--background-index",
--                     "--fallback-style=Google",
--                     "--all-scopes-completion",
--                     "--clang-tidy",
--                     "--log=error",
--                     "--suggest-missing-includes",
--                     "--cross-file-rename",
--                     "--completion-style=detailed",
--                     "--pch-storage=memory", -- could also be disk
--                     "--folding-ranges",
--                     "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
--                     "--offset-encoding=utf-16", --temporary fix for null-ls
--                     "--header-insertion-decorators",
--                     "--header-insertion=iwyu",
--                     "--inlay-hints=true", -- gives the type next to auto
--                 },
--                 capabilites = capabilities,
--                 filetypes = { "c", "cpp", "objc", "objcpp" },
--                 root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
--                 on_attach = function(client, bufnr)
--                     -- require("clangd_extensions.inlay_hints").request_all_inlays()
--                     require("clangd_extensions.inlay_hints").setup_autocmd()
--                     require("clangd_extensions.inlay_hints").set_inlay_hints()
--                 end,
--             })

--             -- vim.keymap.set('n', '<leader>P', function() vim.lsp.buf.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })

--             -- vim.lsp.buf.inlay_hint(0, true)

--             vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
--             vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
--             vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
--             vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})
--             vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
--             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--             vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--             vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--             vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
--             vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
--             vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
--             vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
--         end,
--     },
-- }

-- return {}




            -- on_attach = function(client, bufnr)
            --     vim.g.inlay_hints_visible = false
            --     local function toggle_inlay_hints()
            --         if vim.g.inlay_hints_visible then
            --             vim.g.inlay_hints_visible = false
            --             vim.lsp.inlay_hint(bufnr, false)
            --         else
            --             if client.server_capabilities.inlayHintProvider then
            --                 vim.g.inlay_hints_visible = true
            --                 vim.lsp.inlay_hint(bufnr, true)
            --             else
            --                 print("no inlay hints available")
            --             end
            --         end
            --     end
            -- end,

            -- vim.g.inlay_hints_visible = true
            -- local function toggle_inlay_hints()
            --     if vim.g.inlay_hints_visible then
            --         vim.g.inlay_hints_visible = false
            --         vim.lsp.inlay_hint(bufnr, false)
            --     else
            --         if client.server_capabilities.inlayHintProvider then
            --             vim.g.inlay_hints_visible = true
            --             vim.lsp.inlay_hint(bufnr, true)
            --         else
            --             print("no inlay hints available")
            --         end
            --     end
            -- end
            -- vim.keymap.set(
            --     "n",
            --     "<leader>dh",
            --     toggle_inlay_hints,
            --     vim.tbl_extend("force", bufopts, { desc = "✨lsp toggle inlay hints" })
            -- )

