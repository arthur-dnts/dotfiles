-- Lazy.nvim setup
require("config.lazy")
require("lazy").setup("plugins")

-- Configuração de números de linha
vim.opt.number = true
vim.opt.relativenumber = true

-- Configuração de quebra automática de linhas (visual)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

-- Configuração de text encoding e identação
vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
