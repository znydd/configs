-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Editor options
local opt = vim.opt

opt.number = true               -- Show line numbers
opt.relativenumber = true       -- Show relative numbers
opt.swapfile = false            -- Disable swap files
opt.tabstop = 4                 -- Tabs are 4 spaces
opt.shiftwidth = 4              -- Auto-indent is 4 spaces
opt.expandtab = true            -- Convert tabs to spaces
opt.smartindent = true          -- Smart indentation
opt.termguicolors = true        -- Enable full colors
opt.clipboard = "unnamedplus"  -- Use system clipboard
opt.splitbelow = true           -- Horizontal splits open below
opt.splitright = true           -- Vertical splits open to the right

-- Keymaps
local keymap = vim.keymap

-- Better window navigation (like VSCode split navigation)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlight
keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

