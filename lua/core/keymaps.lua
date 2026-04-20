vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "x", '"_x', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "<leader>dp", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Diagnostic: Previous message" })

vim.keymap.set("n", "<leader>dn", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Diagnostic: Next message" })

vim.keymap.set("n", "<leader>dt", vim.diagnostic.open_float, {
  desc = "Diagnostic: Float open",
})

vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, {
  desc = "Diagnostic: List diagnostic",
})

vim.api.nvim_set_keymap(
	"n",
	"<leader>fm",
	"<cmd>lua require('conform').format({ async = true })<CR>",
	{ noremap = true, silent = true, desc = "Format document with Conform" }
)

vim.keymap.set("n", "<leader>fb", function()
	require("customs.show-buffers").ShowBufferPopup()
end, { desc = "Telescope: Show buffers popup" })

vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "BufferLine: Cycle left" })
vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "BufferLine: Cycle right" })
vim.keymap.set("n", "<leader>bd", "<Cmd>Bdelete<CR>", { desc = "BufferLine: Buffer delete" })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLineCloseOthers<CR>", { desc = "BufferLine: Close others" })
