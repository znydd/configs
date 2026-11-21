vim.g.mapleader = " "
vim.o.number = true
vim.o.numberwidth = 1
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.mouse = "a"
vim.o.wrap = true
vim.o.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.wrap = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.autoread = true
vim.opt.exrc = true
vim.opt.secure = true

-- Pre-create the FileExplorer augroup. nvim-tree's netrw hijack runs
-- `autocmd! FileExplorer *`, which raises E216 on newer Neovim unless the
-- group already exists.
vim.api.nvim_create_augroup("FileExplorer", { clear = false })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime"
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained" }, {
  pattern = "*",
  command = "checktime"
})
