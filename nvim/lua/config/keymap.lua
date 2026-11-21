local opts = { noremap = true, silent = true }

-- Toggle the file-tree sidebar (registered here so it exists at startup,
-- independent of plugin/lazy loading). Normal mode only.
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { silent = true, desc = "Toggle file tree" })

-- Treesitter code folds (functions, classes, and other syntax nodes).
vim.keymap.set("n", "<leader>fc", "za", { desc = "Toggle code fold" })
vim.keymap.set("n", "<leader>fC", "zM", { desc = "Collapse all folds" })
vim.keymap.set("n", "<leader>fo", "zR", { desc = "Open all folds" })

vim.keymap.set("n", "<leader>uh", function()
	local filter = { bufnr = vim.api.nvim_get_current_buf() }
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
end, { desc = "Toggle inlay hints" })

-- Ctrl+/ may arrive as Ctrl+_ in terminals without extended key reporting.
for _, key in ipairs({ "<C-/>", "<C-_>" }) do
	vim.keymap.set("n", key, "gcc", { remap = true, desc = "Toggle line comment" })
	vim.keymap.set("x", key, "gc", { remap = true, desc = "Toggle selected comments" })
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "<C-j>", ":cnext<CR>", opts)
vim.keymap.set("n", "<C-k>", ":cprevious<CR>", opts)
vim.keymap.set("n", "<leader>R", function()
	vim.ui.input({ prompt = "Command: " }, function(command)
		local dir = vim.fn.expand("%:p:h")
		if command then -- check for nil in case user cancels
			vim.cmd(string.format("!cd %s && %s", dir, command))
		end
	end)
end, opts)
vim.keymap.set("v", "<leader>R", function()
	vim.ui.input({ prompt = "Command: " }, function(command)
		local dir = vim.fn.expand("%:p:h")
		if command then -- check for nil in case user cancels
			vim.cmd(string.format("!cd %s && %s", dir, command))
		end
	end)
end, opts)
