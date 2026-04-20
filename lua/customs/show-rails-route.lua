local M = {}

function M.show_routes_for_controller()
	local controller = vim.fn.expand("%:t:r")
	controller = controller:gsub("_controller", "")

	local handle = io.popen("bin/rails routes -c " .. controller)
	if not handle then
		return
	end

	local result = handle:read("*a")
	handle:close()

	if result == "" then
		vim.notify("No routes found", vim.log.levels.WARN)
		return
	end

	local lines = vim.split(result, "\n")

	local buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local max_line_width = 0
	for _, line in ipairs(lines) do
		max_line_width = math.max(max_line_width, vim.fn.strdisplaywidth(line))
	end

	local width = math.min(max_line_width + 4, 120)
	local height = math.min(#lines, math.floor(vim.o.lines * 0.6))

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf, nowait = true })

	vim.bo[buf].filetype = "ruby"
end

return M
