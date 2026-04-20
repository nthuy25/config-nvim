return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 7, -- Default terminal size
		hide_numbers = true, -- Hide line numbers in terminal
		shade_terminals = true, -- Add shading to terminal
		shading_factor = 2, -- Amount of shading
		start_in_insert = true, -- Start terminal in insert mode
		persist_size = true, -- Remember terminal size
		direction = "float", -- Default direction: "horizontal", "vertical", "float", "tab"
		close_on_exit = true, -- Close terminal when process exits
		shell = vim.o.shell, -- Use Neovim's default shell
	},

	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm: Float terminal" },
		{ "<leader>tl", "<cmd>TermSelect<cr>", desc = "ToggleTerm: Select terminals" },
		{
			"<leader>tn",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local term = Terminal:new({ direction = "float" })
				term:toggle()
			end,
			desc = "ToggleTerm: New float terminal",
		},
	},
}
