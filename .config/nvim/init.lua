-- Lazy.nvim setup
require("config.lazy")
require("lazy").setup("plugins")

-- Line number indicator settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Automatic row break settings (visual)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ ",

-- Text encoding andd identation settings
vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
