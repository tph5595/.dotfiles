function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- Enable below for transparent background
	-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return{
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            vim.cmd('colorscheme rose-pine')
            ColorMyPencils()
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}
