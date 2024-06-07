return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim"
		},
		config = function()
			require("neodev").setup{}

			local capabilities = nil

			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require "lspconfig"

			local servers = {
				bashls = true,
				gopls = true,
				rust_analyzer = true,
				svelte = true,
				clangd = true,
				tsserver = true,
				jsonls = true,
				jdtls = true,
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
				return not lspconfig[key]
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"lua_ls",
				"delve",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup { ensure_installed = ensure_installed }

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config)
				lspconfig[name].setup(config)
			end

			local disable_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have a valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					local _lsp = vim.lsp.buf

					vim.keymap.set("n", "gd", _lsp.definition, { buffer = 0 })
					vim.keymap.set("n", "gD", _lsp.declaration, { buffer = 0 })
					vim.keymap.set("n", "gr", _lsp.references, { buffer = 0 })
					vim.keymap.set("n", "gi", _lsp.implementation, { buffer = 0 })
					vim.keymap.set("n", "gT", _lsp.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", _lsp.hover, { buffer = 0 })
					vim.keymap.set("n", "<C-k>", _lsp.signature_help, { buffer = 0 })
					vim.keymap.set("n", "<leader>rn", _lsp.rename, { buffer = 0 })
					vim.keymap.set("n", "<leader>ca", _lsp.code_action, { buffer = 0 })

					local file_type = vim.bo[bufnr].filetype
					if disable_tokens[file_type] then
						client.server_capabilities.completionProvider = nil
					end
				end,
			})
		end,
	},
}
