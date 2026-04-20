return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>lt", "<cmd>LazyGit<cr>", desc = "LazyGit: Git toggle" },
		{ "<leader>lc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit: Git current file" },
		{ "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit: Git filter" },
		{ "<leader>lF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit: Git filter current file" },
	},
}
