require("core.keymaps")
require("core.options")

-- Init - clone Lazy Nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.neotree"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.mason-fix"),
	require("plugins.conform"),
	require("plugins.autocompletion"),
	require("plugins.gitsigns"),
	require("plugins.mics"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.noice"),
	require("plugins.bufferline"),
	require("plugins.lazygit"),
	require("plugins.toggleterm"),
	require("plugins.autopair"),
	require("plugins.autotag"),
	require("plugins.auto-session"),
	require("plugins.rails"),
})

-- Setup custom functions
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.fn.expand("%") ~= "" then
			vim.cmd("silent! write")
		end
	end,
})

-- Setup custom functions
local rails_routes = require("customs.show-rails-route")
vim.keymap.set("n", "<leader>rr", rails_routes.show_routes_for_controller, { desc = "Rails: Show routes of controller"} )
