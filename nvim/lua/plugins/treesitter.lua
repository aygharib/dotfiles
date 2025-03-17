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
    }
}
