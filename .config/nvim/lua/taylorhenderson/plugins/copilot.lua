local copilot_on = false
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_on then
		vim.cmd("Copilot disable")
		print("Copilot OFF")
	else
		vim.cmd("Copilot enable")
		print("Copilot ON")
	end
	copilot_on = not copilot_on
end, { nargs = 0 })

return {
    {
        "github/copilot.vim",
        lazy = true,
        keys = {
            { "<leader>c", "<cmd>CopilotToggle<cr>", desc = "Copilot toggle" },
        },
    }
}
