return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
				ensure_installed = {
					"lua",
					"typescript",
					"tsx",
					"go",
					"javascript",
					"markdown",
					"markdown_inline",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 1,
			on_attach = function(bufnr)
				local disabled_filetypes = {
					markdown = true,
					["markdown.mdx"] = true,
				}

				return not disabled_filetypes[vim.bo[bufnr].filetype]
			end,
		},
	},
}
