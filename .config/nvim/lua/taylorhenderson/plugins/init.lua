return {
    {
        "mbbill/undotree",
        config = function ()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- comment da tings
    "tpope/vim-commentary",
    {
        'j-hui/fidget.nvim',
        config = function()
            require("fidget").setup({})
        end
    },
    "tpope/vim-repeat",
    {
        "folke/zen-mode.nvim",
        config = function ()
            vim.keymap.set("n", "<leader><leader>", function ()
                require("zen-mode").toggle({
                    window = {
                        width = .85 -- width will be 85% of the editor width
                    }
                })
            end)
        end
    },
    -- Good markdown stuff <leader>e for code block editing with syntax highitng in
    -- sepereate window
    -- "gabrielelana/vim-markdown"
    "nvim-tree/nvim-web-devicons",
}
