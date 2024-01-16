local copilot_on = true
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
        config = function ()
            vim.keymap.set("n", "<leader>c", "<Cmd>CopilotToggle<CR>")
        end
    }
}
