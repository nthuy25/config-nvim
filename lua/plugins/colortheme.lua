local colors = require("core.colors")

return {
	"Mofiqul/dracula.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("dracula").setup({
			italic_comment = true,
			lualine_bg_color = colors.surface,
			colors = colors.dracula(),

			overrides = {
				Normal = { bg = colors.bg, fg = colors.fg },
				NormalFloat = { bg = colors.bg, fg = colors.fg },
				Cursor = { fg = colors.cursor_text, bg = colors.cursor },
				CursorLine = { bg = colors.surface },
				CursorLineNr = { fg = colors.selection_fg, bold = true },
				LineNr = { fg = colors.gutter },
				SignColumn = { bg = colors.bg },
				ColorColumn = { bg = colors.selection_bg },

				Visual = { bg = colors.selection_bg, fg = colors.selection_fg },
				VisualNOS = { bg = colors.selection_bg },

				Search = { fg = colors.bg, bg = colors.yellow },
				IncSearch = { fg = colors.bg, bg = colors.orange },

				WinSeparator = { fg = colors.selection_bg },
				VertSplit = { fg = colors.selection_bg },
				FloatBorder = { fg = colors.comment },
				FloatTitle = { fg = colors.purple, bg = colors.menu },

				StatusLine = { bg = colors.surface, fg = colors.fg },
				StatusLineNC = { bg = colors.bg, fg = colors.comment },
				TabLine = { bg = colors.bg, fg = colors.comment },
				TabLineSel = { bg = colors.surface, fg = colors.fg },
				TabLineFill = { bg = colors.bg },

				Pmenu = { bg = colors.menu, fg = colors.fg },
				PmenuSel = { bg = colors.selection_bg, fg = colors.selection_fg },
				PmenuSbar = { bg = colors.menu },
				PmenuThumb = { bg = colors.comment },

				DiagnosticError = { fg = colors.bright_red },
				DiagnosticWarn = { fg = colors.orange },
				DiagnosticInfo = { fg = colors.cyan },
				DiagnosticHint = { fg = colors.purple },
				DiagnosticUnderlineError = { undercurl = true, sp = colors.bright_red },
				DiagnosticUnderlineWarn = { undercurl = true, sp = colors.orange },
				DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
				DiagnosticUnderlineHint = { undercurl = true, sp = colors.purple },

				LspReferenceText = { bg = colors.selection_bg },
				LspReferenceRead = { bg = colors.selection_bg },
				LspReferenceWrite = { bg = colors.selection_bg },

				DiffAdd = { bg = colors.green, fg = colors.bg },
				DiffChange = { fg = colors.cyan },
				DiffDelete = { fg = colors.red },
				GitSignsAdd = { fg = colors.bright_green },
				GitSignsChange = { fg = colors.cyan },
				GitSignsDelete = { fg = colors.bright_red },

				TelescopeNormal = { bg = colors.bg, fg = colors.fg },
				TelescopeBorder = { fg = colors.comment },
				TelescopePromptBorder = { fg = colors.comment },
				TelescopeResultsBorder = { fg = colors.comment },
				TelescopePreviewBorder = { fg = colors.comment },
				TelescopeSelection = { bg = colors.selection_bg, fg = colors.selection_fg },
				TelescopeSelectionCaret = { fg = colors.selection_fg },
				TelescopeMatching = { fg = colors.green },

				NeoTreeNormal = { bg = colors.menu, fg = colors.fg },
				NeoTreeNormalNC = { bg = colors.menu, fg = colors.fg },
				NeoTreeWinSeparator = { fg = colors.selection_bg },
				NeoTreeIndentMarker = { fg = colors.comment },
				NeoTreeExpander = { fg = colors.comment },
				NeoTreeDirectoryIcon = { fg = colors.purple },
				NeoTreeDirectoryName = { fg = colors.cyan },
				NeoTreeFileName = { fg = colors.fg },
				NeoTreeFileIcon = { fg = colors.fg },
				NeoTreeModified = { fg = colors.orange },
				NeoTreeGitAdded = { fg = colors.bright_green },
				NeoTreeGitModified = { fg = colors.bright_magenta },
				NeoTreeGitDeleted = { fg = colors.bright_red },
				NeoTreeGitIgnored = { fg = colors.comment },
				NeoTreeGitUntracked = { fg = colors.bright_green },

				CmpPmenu = { bg = colors.menu },
				CmpPmenuSel = { bg = colors.selection_bg, fg = colors.selection_fg },
				CmpItemAbbrMatch = { fg = colors.green },
				CmpItemAbbrMatchFuzzy = { fg = colors.green },

				IndentBlanklineChar = { fg = colors.nontext, nocombine = true },
				IndentBlanklineContextChar = { fg = colors.comment, nocombine = true },
				IblIndent = { fg = colors.nontext, nocombine = true },
				IblScope = { fg = colors.comment, nocombine = true },

				TermCursor = { fg = colors.cursor_text, bg = colors.cursor },

				AlphaHeader = { fg = colors.purple },
				AlphaButtons = { fg = colors.cyan },
				AlphaShortcut = { fg = colors.orange },
				AlphaFooter = { fg = colors.pink, italic = true },

				NotifyBackground = { bg = colors.surface },
				NotifyINFOBody = { bg = colors.surface, fg = colors.fg },
				NotifyWARNBody = { bg = colors.surface, fg = colors.fg },
				NotifyERRORBody = { bg = colors.surface, fg = colors.fg },
				NotifyDEBUGBody = { bg = colors.surface, fg = colors.fg },
				NotifyTRACEBody = { bg = colors.surface, fg = colors.fg },
				NotifyINFOBorder = { fg = colors.green },
				NotifyWARNBorder = { fg = colors.orange },
				NotifyERRORBorder = { fg = colors.red },
				NoiceCmdlinePopup = { bg = colors.bg, fg = colors.fg },
				NoiceCmdlinePopupBorder = { fg = colors.comment, bg = colors.bg },
				NoiceCmdlinePopupBorderSearch = { fg = colors.yellow, bg = colors.bg },
				NoiceCmdlinePopupTitle = { fg = colors.cyan, bg = colors.bg },
				NoiceCmdlinePrompt = { bg = colors.bg, fg = colors.fg },
				NoiceCmdlineIcon = { fg = colors.purple },
				NoiceCmdlineIconSearch = { fg = colors.yellow },
				NoicePopup = { bg = colors.bg, fg = colors.fg },
				NoicePopupBorder = { fg = colors.comment, bg = colors.bg },
				NoicePopupmenu = { bg = colors.menu, fg = colors.fg },
				NoicePopupmenuSelected = { bg = colors.selection_bg, fg = colors.selection_fg },

				WhichKey = { fg = colors.cyan },
				WhichKeyGroup = { fg = colors.purple },
				WhichKeyDesc = { fg = colors.fg },
				WhichKeySeparator = { fg = colors.comment },

				TodoBgTODO = { bg = colors.menu, fg = colors.cyan },
				TodoBgFIX = { bg = colors.menu, fg = colors.bright_red },
				TodoBgHACK = { bg = colors.menu, fg = colors.orange },
				TodoBgNOTE = { bg = colors.menu, fg = colors.green },
				TodoBgWARN = { bg = colors.menu, fg = colors.yellow },

				LazyNormal = { bg = colors.bg, fg = colors.fg },
				LazyButton = { bg = colors.menu, fg = colors.fg },
				LazyButtonActive = { bg = colors.selection_bg, fg = colors.selection_fg },

				MasonNormal = { bg = colors.bg, fg = colors.fg },
				MasonHeader = { bg = colors.menu, fg = colors.cyan },
				MasonHighlight = { fg = colors.green },

				BufferLineFill = { bg = colors.black, fg = colors.comment },
				BufferLineBackground = { bg = colors.bg, fg = colors.comment },
				BufferLineBuffer = { bg = colors.bg, fg = colors.comment },
				BufferLineBufferVisible = { bg = colors.bg, fg = colors.fg },
				BufferLineBufferSelected = { bg = colors.bg, fg = colors.fg, bold = true },
				BufferLineIndicatorSelected = { fg = colors.purple, bg = colors.bg },
				BufferLineCloseButton = { fg = colors.comment, bg = colors.bg },
				BufferLineCloseButtonVisible = { fg = colors.fg, bg = colors.bg },
				BufferLineCloseButtonSelected = { fg = colors.comment, bg = colors.bg },
				BufferLineSeparator = { fg = colors.bg, bg = colors.bg },
				BufferLineSeparatorVisible = { fg = colors.bg, bg = colors.bg },
				BufferLineSeparatorSelected = { fg = colors.purple, bg = colors.bg },
				BufferLineModified = { fg = colors.orange, bg = colors.bg },
				BufferLineModifiedSelected = { fg = colors.orange, bg = colors.bg },
				BufferLineDuplicate = { fg = colors.comment, bg = colors.bg, italic = true },
				BufferLineErrorSelected = { fg = colors.red, bg = colors.bg },
				BufferLineWarningSelected = { fg = colors.orange, bg = colors.bg },
				BufferLineInfoSelected = { fg = colors.cyan, bg = colors.bg },
				BufferLineHintSelected = { fg = colors.purple, bg = colors.bg },

				FidgetTask = { fg = colors.cyan },
				FidgetTitle = { fg = colors.purple },
			},
		})

		vim.cmd.colorscheme("dracula")
		colors.apply_terminal()
		colors.patch_neotree_highlights()
		colors.patch_noice_highlights()
		colors.apply_neotree()
		colors.apply_noice()
	end,
}
