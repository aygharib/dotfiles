-- This is responsible for:
-- Syntax Highlighting - parses code structure over the traditional vim based on regex
-- Folding - based on syntax tree over the traditional vim based on indentation
-- Incremental selection
-- Indentation - syntax aware indentation
-- Navigation - jump between functions, classes
-- Refactoring - rename, highlight, swap coed

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "c", "cpp" }, -- install parses for C, C++
                highlight = { enable = true }, -- enable syntax highlighting
                indent = { enable = true },  -- enable better indentation
                -- incremental_selection = { -- can't figure out how to get this working for now
                --     enable = true,
                --     keymaps = {
                --         init_selection = "<ty>",
                --         node_incremental = "<C-Space>",
                --         scope_incremental = "<C-s>",
                --         node_decremental = "<BS>",
                --     }
                -- }
            })
        end
    },
    {
        "folke/tokyonight.nvim", -- Add the theme plugin
        -- "catppuccin/nvim",
        -- 'kepano/flexoki-neovim',
        -- name = "flexoki",
        config = function()
            vim.cmd("colorscheme tokyonight") -- Apply the theme
            -- vim.cmd("colorscheme catppuccin") -- Apply the theme
            -- vim.cmd("colorscheme flexoki") -- Apply the theme
            -- vim.cmd('colorscheme flexoki-dark')
        end
    }
}

-- return {}

-- return {
--     {
--         "nvim-treesitter/nvim-treesitter",
--         build = ":TSUpdate",
--         config = function()
--             local config = require("nvim-treesitter.configs")
--             config.setup({
--                 ensure_installed = { "c", "cpp" }, -- install parsers for C, C++
--                 highlight = { enable = true },    -- enable syntax highlighting
--                 indent = { enable = true },       -- enable better indentation
--             })
--         end
--     },
--     {
--         "folke/tokyonight.nvim", -- Tokyonight theme plugin
--     },
--     {
--         "catppuccin/nvim", name = "catppuccin" -- Catppuccin theme plugin
--     },
--     {
--         -- Keybinding configuration for theme switching
--         config = function()
--             vim.keymap.set("n", "<leader>st", function()
--                 local current_theme = vim.g.colors_name
--                 if current_theme == "tokyonight" then
--                     vim.cmd("colorscheme catppuccin")
--                 else
--                     vim.cmd("colorscheme tokyonight")
--                 end
--             end, { desc = "Switch theme" })
            
--             -- Set a default theme on startup
--             vim.cmd("colorscheme tokyonight")
--         end
--     }
-- }
