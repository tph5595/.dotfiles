return {
    {
        "https://github.com/folke/trouble.nvim",
        config = function ()
            vim.keymap.set("n", "<leader>tt", function() 
                require("trouble").toggle() 
            end)
            -- jump to the next item, skipping the groups
            vim.keymap.set("n", "<leader>[d", function() 
                require("trouble").next({skip_groups = true, jump = true})
            end);

            -- jump to the previous item, skipping the groups
            vim.keymap.set("n", "<leader>]d", function() 
                require("trouble").previous({skip_groups = true, jump = true})
            end);
        end
    },
}
