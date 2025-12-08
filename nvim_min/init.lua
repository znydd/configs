local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Settings
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.mouse = 'a'             -- Enable mouse support
vim.opt.ignorecase = true       -- Case insensitive search
vim.opt.smartcase = true        -- Unless uppercase is used
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Incremental search
vim.opt.wrap = false            -- Don't wrap lines
vim.opt.tabstop = 4             -- Tab width
vim.opt.shiftwidth = 4          -- Indent width
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.autoindent = true       -- Auto indent
vim.opt.smartindent = true      -- Smart indent
vim.opt.termguicolors = true    -- True color support
vim.opt.signcolumn = 'yes'      -- Always show sign column
vim.opt.updatetime = 300        -- Faster completion
vim.opt.splitright = true       -- Split to the right
vim.opt.splitbelow = true       -- Split below
vim.opt.clipboard = 'unnamedplus' -- System clipboard
vim.opt.scrolloff = 8           -- Keep 8 lines visible when scrolling
vim.cmd('syntax enable') -- Use vim.cmd() to run a Vim command.

-- Leader key
vim.g.mapleader = ' '

-- Basic Keymaps
local map = vim.keymap.set

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize windows
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Clear search highlight
map('n', '<Esc>', ':noh<CR>', { desc = 'Clear search highlight' })

-- Better indenting
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Move lines
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep cursor centered
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })
map('n', 'n', 'nzzzv', { desc = 'Next search result' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result' })

-- Quick save
map('n', '<C-s>', ':w<CR>', { desc = 'Save file' })

-- Quick quit
map('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- File explorer
map('n', '<leader>e', ':Ex<CR>', { desc = 'Open file explorer' })


require("lazy").setup({
  
  -- --- UI & Colors ---
  -- { 'folke/tokyonight.nvim', lazy = true },
  { 
    'rose-pine/neovim', 
    name = 'rose-pine',
    config = function()
      -- Since we loaded it above, we can skip the config here, 
      -- but this makes sure lazy knows about it.
    end
  },

  -- --- Core Functionality ---
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Command to run after installation
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Minimal syntax setup for C
        ensure_installed = { 'c', 'cpp', 'lua', 'vimdoc' }, -- Ensure C parser is installed
        
        highlight = {
          enable = true, -- Enable Treesitter highlighting
          -- Disable old Vim regex highlighting to rely completely on Treesitter
          additional_vim_regex_highlighting = false, 
        },

        -- Disable other modules for a truly minimal setup
        indent = { enable = false },
        auto_install = true, 
      })
    end
  },
  
  -- Good addition: Use this for smooth, automatic pairing of brackets
  { 
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup {} end
  },
  
})

vim.cmd('colorscheme rose-pine')
