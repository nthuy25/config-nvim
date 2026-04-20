return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-l>"] = require("telescope.actions").select_default,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					hidden = true,
				},

				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},

				buffers = {
					sort_mru = true,
					ignore_current_buffer = true,
					previewer = false,
					theme = "dropdown",
					initial_mode = "normal",
					mappings = {
						i = {
							["<Tab>"] = require("telescope.actions").move_selection_next,
							["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						},
						n = {
							["<Tab>"] = require("telescope.actions").move_selection_next,
							["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Search help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: Search keymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Search files" })
		vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Telescope: Search select options" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope: Search current word" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Search by grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope: Search diagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope: Search resume" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Telescope: Search recent files" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope: Search current buffers" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
				winblend = 0,
				previewer = false,
			}))
		end, { desc = "Telescope: Fuzzily search in current buffer" })
	end,
}
