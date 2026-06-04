--- Terminal / Dracula palette (single source of truth)
local M = {
	bg = "#131313",
	fg = "#FCFCFC",

	selection_bg = "#252525",
	selection_fg = "#50FA7B",

	cursor = "#FCFCFC",
	cursor_text = "#131313",

	surface = "#1b1b1b",
	menu = "#21222C",

	black = "#21222C",
	red = "#FF5555",
	green = "#50FA7B",
	yellow = "#F1FA8C",
	purple = "#BD93F9",
	pink = "#FF79C6",
	cyan = "#8BE9FD",
	white = "#F8F8F2",

	comment = "#6272A4",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",

	orange = "#FFB86C",
	nontext = "#3B4048",
	gutter = "#555555",
}

---@return table Dracula.nvim
function M.dracula()
	return {
		bg = M.bg,
		fg = M.fg,
		selection = M.selection_bg,
		comment = M.comment,
		red = M.red,
		orange = M.orange,
		yellow = M.yellow,
		green = M.green,
		purple = M.purple,
		cyan = M.cyan,
		pink = M.pink,
		bright_red = M.bright_red,
		bright_green = M.bright_green,
		bright_yellow = M.bright_yellow,
		bright_blue = M.bright_blue,
		bright_magenta = M.bright_magenta,
		bright_cyan = M.bright_cyan,
		bright_white = M.bright_white,
		menu = M.menu,
		visual = M.selection_bg,
		gutter_fg = M.comment,
		nontext = M.nontext,
		white = M.white,
		black = M.black,
	}
end

local function hi(name, spec)
	if spec.link then
		vim.cmd("highlight! link " .. name .. " " .. spec.link)
		return
	end
	local parts = { "highlight!", name }
	if spec.fg then
		table.insert(parts, "guifg=" .. spec.fg)
	end
	if spec.bg then
		table.insert(parts, "guibg=" .. spec.bg)
	end
	if spec.gui then
		table.insert(parts, "gui=" .. spec.gui)
	end
	vim.cmd(table.concat(parts, " "))
end

function M.neotree_winhighlight()
	return table.concat({
		"Normal:NeoTreeNormal",
		"NormalNC:NeoTreeNormalNC",
		"SignColumn:NeoTreeSignColumn",
		"CursorLine:NeoTreeCursorLine",
		"FloatBorder:NeoTreeFloatBorder",
		"StatusLine:NeoTreeStatusLine",
		"StatusLineNC:NeoTreeStatusLineNC",
		"VertSplit:NeoTreeVertSplit",
		"EndOfBuffer:NeoTreeEndOfBuffer",
		"WinSeparator:NeoTreeWinSeparator",
	}, ",")
end

function M.apply_neotree_win(winid)
	if winid and vim.api.nvim_win_is_valid(winid) then
		vim.api.nvim_set_option_value("winhighlight", M.neotree_winhighlight(), { win = winid })
	end
end

function M.apply_neotree()
	local bg = M.bg
	local panel = M.bg

	hi("NeoTreeNormal", { fg = M.fg, bg = panel })
	hi("NeoTreeNormalNC", { fg = M.fg, bg = panel })
	hi("NeoTreeFloatNormal", { fg = M.fg, bg = bg })
	hi("NeoTreeFloatBorder", { fg = M.comment, bg = panel })
	hi("NeoTreeFloatTitle", { fg = M.cyan, bg = panel })
	hi("NeoTreeTitleBar", { fg = M.fg, bg = panel })
	hi("NeoTreeWinSeparator", { fg = M.selection_bg, bg = panel })
	hi("NeoTreeVertSplit", { fg = M.selection_bg, bg = panel })
	hi("NeoTreeEndOfBuffer", { fg = panel, bg = panel })
	hi("NeoTreeSignColumn", { bg = panel })
	hi("NeoTreeStatusLine", { fg = M.fg, bg = M.surface })
	hi("NeoTreeStatusLineNC", { fg = M.comment, bg = bg })
	hi("NeoTreeCursorLine", { bg = M.surface, gui = "bold" })
	hi("NeoTreeDirectoryIcon", { fg = M.purple, bg = panel })
	hi("NeoTreeDirectoryName", { fg = M.cyan, bg = panel })
	hi("NeoTreeFileIcon", { fg = M.fg, bg = panel })
	hi("NeoTreeFileName", { fg = M.fg, bg = panel })
	hi("NeoTreeFileNameOpened", { fg = M.selection_fg, bg = panel, gui = "bold" })
	hi("NeoTreeIndentMarker", { fg = M.comment, bg = panel })
	hi("NeoTreeExpander", { fg = M.comment, bg = panel })
	hi("NeoTreeModified", { fg = M.orange, bg = panel })
	hi("NeoTreeRootName", { fg = M.purple, bg = panel, gui = "bold,italic" })
	hi("NeoTreeDimText", { fg = M.comment, bg = panel })
	hi("NeoTreeFadeText1", { fg = M.comment, bg = panel })
	hi("NeoTreeFadeText2", { fg = M.nontext, bg = panel })
	hi("NeoTreeDotfile", { fg = M.comment, bg = panel })
	hi("NeoTreeIgnored", { fg = M.comment, bg = panel })
	hi("NeoTreeHiddenByName", { fg = M.comment, bg = panel })
	hi("NeoTreeMessage", { fg = M.comment, bg = panel, gui = "italic" })
	hi("NeoTreeGitAdded", { fg = M.bright_green, bg = panel })
	hi("NeoTreeGitModified", { fg = M.bright_magenta, bg = panel })
	hi("NeoTreeGitDeleted", { fg = M.bright_red, bg = panel })
	hi("NeoTreeGitIgnored", { fg = M.comment, bg = panel })
	hi("NeoTreeGitUntracked", { fg = M.bright_green, bg = panel, gui = "italic" })
	hi("NeoTreeGitStaged", { fg = M.bright_green, bg = panel })
	hi("NeoTreeGitUnstaged", { fg = M.orange, bg = panel, gui = "bold,italic" })
	hi("NeoTreeGitConflict", { fg = M.orange, bg = panel, gui = "bold,italic" })
	hi("NeoTreeGitRenamed", { fg = M.bright_magenta, bg = panel })
	hi("NeoTreeTabActive", { fg = M.fg, bg = panel, gui = "bold" })
	hi("NeoTreeTabInactive", { fg = M.comment, bg = M.surface })
	hi("NeoTreeTabSeparatorActive", { fg = M.selection_bg, bg = panel })
	hi("NeoTreeTabSeparatorInactive", { fg = M.surface, bg = M.surface })
	hi("NeoTreeFileStats", { fg = M.comment, bg = panel })
	hi("NeoTreeFileStatsHeader", { fg = M.comment, bg = panel, gui = "italic" })
	hi("NeoTreePreview", { link = "Search" })
end

function M.apply_noice()
	local bg = M.bg
	local surface = M.surface

	hi("NoiceCmdlinePopup", { fg = M.fg, bg = bg })
	hi("NoiceCmdlinePopupBorder", { fg = M.comment, bg = bg })
	hi("NoiceCmdlinePopupBorderSearch", { fg = M.yellow, bg = bg })
	hi("NoiceCmdlinePopupTitle", { fg = M.cyan, bg = bg })
	hi("NoiceCmdline", { fg = M.fg, bg = surface })
	hi("NoiceCmdlinePrompt", { fg = M.fg, bg = bg })
	hi("NoiceCmdlineIcon", { fg = M.purple, bg = bg })
	hi("NoiceCmdlineIconSearch", { fg = M.yellow, bg = bg })
	hi("NoicePopup", { fg = M.fg, bg = bg })
	hi("NoicePopupBorder", { fg = M.comment, bg = bg })
	hi("NoicePopupmenu", { fg = M.fg, bg = M.menu })
	hi("NoicePopupmenuBorder", { fg = M.comment, bg = M.menu })
	hi("NoicePopupmenuMatch", { fg = M.green, bg = M.menu })
	hi("NoicePopupmenuSelected", { fg = M.selection_fg, bg = M.selection_bg })
	hi("NoiceConfirm", { fg = M.fg, bg = bg })
	hi("NoiceConfirmBorder", { fg = M.comment, bg = bg })
	hi("NoiceMini", { fg = M.fg, bg = surface })
	hi("NoiceSplit", { fg = M.fg, bg = bg })
	hi("NoiceSplitBorder", { fg = M.comment, bg = bg })
end

function M.patch_noice_highlights()
	local ok, highlights = pcall(require, "noice.config.highlights")
	if not ok or highlights._custom_colors_patched then
		return
	end

	local original_setup = highlights.setup
	highlights.setup = function()
		original_setup()
		M.apply_noice()
	end
	highlights._custom_colors_patched = true
end

function M.patch_neotree_highlights()
	local ok, highlights = pcall(require, "neo-tree.ui.highlights")
	if not ok or highlights._custom_colors_patched then
		return
	end

	local original_setup = highlights.setup
	highlights.setup = function()
		original_setup()
		M.apply_neotree()
	end
	highlights._custom_colors_patched = true
end

function M.setup_neotree_events()
	local events = require("neo-tree.events")

	local function refresh(args)
		M.apply_neotree()
		if args and args.winid then
			M.apply_neotree_win(args.winid)
		elseif vim.bo.filetype == "neo-tree" then
			M.apply_neotree_win(vim.api.nvim_get_current_win())
		end
	end

	events.subscribe({
		event = events.NEO_TREE_WINDOW_AFTER_OPEN,
		handler = refresh,
		id = "custom-neotree-colors-open",
	})

	events.subscribe({
		event = events.NEO_TREE_BUFFER_ENTER,
		handler = refresh,
		id = "custom-neotree-colors-enter",
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("custom-neotree-colors", { clear = true }),
		callback = function()
			vim.schedule(refresh)
		end,
	})
end

function M.bufferline()
	local fg = M.fg
	local bg = M.bg
	local bar = M.black
	local muted = M.comment
	local tab = bg

	local function hl(fg_color, bg_color, extra)
		return vim.tbl_extend("force", { fg = fg_color, bg = bg_color }, extra or {})
	end

	local selected = { bold = true }
	local sel_indicator = hl(M.purple, bg, selected)

	return {
		fill = hl(muted, bar),
		group_separator = hl(muted, bar),
		group_label = hl(bar, muted),
		tab = hl(muted, tab),
		tab_selected = hl(fg, bg, selected),
		tab_close = hl(muted, tab),
		background = hl(muted, tab),
		buffer = hl(muted, tab),
		buffer_visible = hl(fg, tab),
		buffer_selected = hl(fg, bg, selected),
		close_button = hl(muted, tab),
		close_button_visible = hl(fg, tab),
		close_button_selected = hl(muted, bg),
		numbers = hl(muted, tab),
		numbers_visible = hl(fg, tab),
		numbers_selected = hl(fg, bg, selected),
		indicator_selected = sel_indicator,
		indicator_visible = hl(tab, tab),
		separator = hl(bg, tab),
		separator_visible = hl(bg, tab),
		separator_selected = hl(M.purple, bg, selected),
		tab_separator = hl(bg, tab),
		tab_separator_selected = hl(M.purple, bg, selected),
		modified = hl(M.orange, tab),
		modified_visible = hl(M.orange, tab),
		modified_selected = hl(M.orange, bg, selected),
		duplicate = hl(muted, tab, { italic = true }),
		duplicate_visible = hl(muted, tab, { italic = true }),
		duplicate_selected = hl(muted, bg, { italic = true }),
		trunc_marker = hl(muted, bar),
		pick = hl(M.red, tab, { bold = true }),
		pick_visible = hl(M.red, tab, { bold = true }),
		pick_selected = hl(M.red, bg, { bold = true }),
		error = hl(muted, tab, { sp = M.red }),
		error_visible = hl(fg, tab, { sp = M.red }),
		error_selected = hl(M.red, bg, selected),
		warning = hl(muted, tab, { sp = M.orange }),
		warning_visible = hl(fg, tab, { sp = M.orange }),
		warning_selected = hl(M.orange, bg, selected),
		info = hl(muted, tab, { sp = M.cyan }),
		info_visible = hl(fg, tab, { sp = M.cyan }),
		info_selected = hl(M.cyan, bg, selected),
		hint = hl(muted, tab, { sp = M.purple }),
		hint_visible = hl(fg, tab, { sp = M.purple }),
		hint_selected = hl(M.purple, bg, selected),
		diagnostic = hl(muted, tab),
		diagnostic_visible = hl(muted, tab),
		diagnostic_selected = hl(fg, bg, selected),
		error_diagnostic = hl(muted, tab, { sp = M.bright_red }),
		error_diagnostic_visible = hl(muted, tab, { sp = M.bright_red }),
		error_diagnostic_selected = hl(M.bright_red, bg, selected),
		warning_diagnostic = hl(muted, tab, { sp = M.orange }),
		warning_diagnostic_visible = hl(muted, tab, { sp = M.orange }),
		warning_diagnostic_selected = hl(M.orange, bg, selected),
		info_diagnostic = hl(muted, tab, { sp = M.cyan }),
		info_diagnostic_visible = hl(muted, tab, { sp = M.cyan }),
		info_diagnostic_selected = hl(M.cyan, bg, selected),
		hint_diagnostic = hl(muted, tab, { sp = M.purple }),
		hint_diagnostic_visible = hl(muted, tab, { sp = M.purple }),
		hint_diagnostic_selected = hl(M.purple, bg, selected),
		offset_separator = hl(M.selection_bg, bar),
	}
end

function M.lualine()
	local bg = M.surface
	local c = { bg = bg, fg = M.fg }

	local function mode(accent)
		return {
			a = { bg = accent, fg = M.bg, gui = "bold" },
			b = { bg = bg, fg = accent },
			c = c,
		}
	end

	return {
		normal = mode(M.purple),
		insert = mode(M.green),
		visual = mode(M.pink),
		replace = mode(M.yellow),
		command = mode(M.cyan),
		inactive = {
			a = { bg = M.selection_bg, fg = M.comment, gui = "bold" },
			b = { bg = M.bg, fg = M.comment },
			c = { bg = M.bg, fg = M.comment },
		},
	}
end

function M.apply_terminal()
	local g = vim.g
	g.terminal_color_0 = M.black
	g.terminal_color_1 = M.red
	g.terminal_color_2 = M.green
	g.terminal_color_3 = M.yellow
	g.terminal_color_4 = M.purple
	g.terminal_color_5 = M.pink
	g.terminal_color_6 = M.cyan
	g.terminal_color_7 = M.white
	g.terminal_color_8 = M.comment
	g.terminal_color_9 = M.bright_red
	g.terminal_color_10 = M.bright_green
	g.terminal_color_11 = M.bright_yellow
	g.terminal_color_12 = M.bright_blue
	g.terminal_color_13 = M.bright_magenta
	g.terminal_color_14 = M.bright_cyan
	g.terminal_color_15 = M.bright_white
	g.terminal_color_background = M.bg
	g.terminal_color_foreground = M.fg
end

return M
