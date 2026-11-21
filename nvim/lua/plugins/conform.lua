return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			html = { "prettierd" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			sql = { "sqlfluff" },
		},
		formatters = {
			sqlfluff = {
				command = vim.fn.expand("~/.local/bin/sqlfluff"),
				args = { "fix", "--dialect", "postgres", "-" },
				require_cwd = false,
			},
		},
		format_on_save = function(bufnr)
			return {
				timeout_ms = vim.bo[bufnr].filetype == "sql" and 5000 or 500,
				lsp_format = "never",
			}
		end,
	},
}
