return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },

		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
			},
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "buffer" },
						{ name = "path" },
					}),
				})
			end,
		},
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local builtin = require("telescope.builtin")

				map("<leader>gd", builtin.lsp_definitions, "Goto Definition")
				map("<leader>gr", builtin.lsp_references, "Goto References")
				map("<leader>gi", builtin.lsp_implementations, "Goto Implementation")
				map("<leader>gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("<leader>gt", builtin.lsp_type_definitions, "Type Definition")
				map("<leader>gs", builtin.lsp_document_symbols, "Document Symbols")
				map("<leader>gw", builtin.lsp_dynamic_workspace_symbols, "Workspace Symbols")
				map("<leader>gr", vim.lsp.buf.rename, "Rename")
				map("<leader>ga", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = group,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = group,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
						vim.lsp.inlay_hint.enable(event.buf, not enabled)
					end, "Toggle Inlay Hints")
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if ok then
			capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
		end
		capabilities.offsetEncoding = { "utf-16" }

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = unpack(vim.api.nvim_get_runtime_file("", true)),
						},
						diagnostics = { globals = { "vim" } },
						format = { enable = false },
					},
				},
			},
		}

		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					vim.lsp.config(server_name, server)
					vim.lsp.enable(server_name)
				end,
			},
		})
	end,
}
