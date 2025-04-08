return {
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = {
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			update_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			sync_root_with_cwd = true,
			view = {
				preserve_window_proportions = true,
				-- width = 20,
				-- hide_root_folder = false,
			},
			git = {
				enable = false,
				ignore = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				indent_markers = {
					enable = false,
				},
			},
		},
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
	}
