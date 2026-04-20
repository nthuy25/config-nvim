local util = require("lspconfig.util")

local function ruby_cmd(root)
	if util.path.exists(util.path.join(root, "Gemfile")) then
		return { "bundle", "exec", "ruby-lsp" }
	end

	return { "ruby-lsp" }
end

return {
	default_config = {
		cmd = ruby_cmd(vim.loop.cwd()),
		filetypes = { "ruby", "eruby" },
		root_dir = util.root_pattern("Gemfile", ".git", ".ruby-version"),
		init_options = {
			formatter = "auto",
		},
		on_new_config = function(new_config, new_root_dir)
			new_config.cmd_cwd = new_root_dir
			new_config.cmd = ruby_cmd(new_root_dir)
		end,
	},
}
