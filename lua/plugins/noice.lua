local colors = require("core.colors")

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		colors.patch_noice_highlights()

		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = {
							Normal = "NoiceCmdlinePopup",
							FloatBorder = "NoiceCmdlinePopupBorder",
							FloatTitle = "NoiceCmdlinePopupTitle",
						},
					},
				},
			},
		})

		colors.apply_noice()

		require("notify").setup({
			background_colour = colors.surface,
		})
	end,
}
