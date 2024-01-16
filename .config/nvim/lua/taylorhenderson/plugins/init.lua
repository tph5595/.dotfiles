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
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v1.x',
    --     dependencies = {
    --         -- LSP Support
    --         {'neovim/nvim-lspconfig'},
    --         {'williamboman/mason.nvim'},
    --         {'williamboman/mason-lspconfig.nvim'},

    --         -- Autocompletion
    --         {'hrsh7th/nvim-cmp'},
    --         {'hrsh7th/cmp-buffer'},
    --         {'hrsh7th/cmp-path'},
    --         {'saadparwaiz1/cmp_luasnip'},
    --         {'hrsh7th/cmp-nvim-lsp'},
    --         {'hrsh7th/cmp-nvim-lua'},

    --         -- Snippets
    --         {'L3MON4D3/LuaSnip'},
    --         {'rafamadriz/friendly-snippets'},
    --     }
   -- },
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
 }
}
