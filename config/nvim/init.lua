vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  -- Adicionando alpha.nvim
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter", -- Carrega ao iniciar o Neovim
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Cabeçalho
      dashboard.section.header = {
        type = "text",
        val = {
          "  ⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠁⠠⢤⡀⠀⣀⠀⠙⠛",
          "  ⣿⣿⣿⡟⠀⠀⠀⠀⢢⢀⣀⡀⠀⠀⠀⠀⠀⠀⢠⠆⠀⠀⠀⠀⢀⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣷⡀⠀⠘⠁⢀⣄⠀",
          "  ⣿⣿⣿⠁⠀⠀⠀⠀⠁⢺⣿⠇⣠⡤⠀⠀⢀⠔⠁⠐⠈⠟⠀⠀⣸⣿⣷⣔⠄⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣷⠄⠁⠀⠸⠟⠀",
          "  ⣿⣿⡇⠀⠀⠀⠀⠀⠀⠙⠁⠘⠋⠀⠀⠐⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣙⠿⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⠸⡄⠀⠀⠀⠀",
          "  ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⣿⡿⠿⠿⠓⠊⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡄⠀⠀⠀⠀",
          "  ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠶⣦⡄⠀⠀⠀⠀⣰⠇⠀⣾⠇⣭⣤⣤⡤⢉⠉⠉⠂⢤⡉⣙⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⢡⠀⠀⠀⠀",
          "  ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣼⢱⣿⣎⢻⡄⠀⠀⣼⣿⠀⢀⣿⡇⠹⣿⣿⢠⠋⠰⠆⠀⠀⠙⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡑⢄⣀⠤",
          "  ⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣾⡧⠻⠎⣧⠀⢠⣿⣿⠀⢸⣿⡇⣿⣮⣛⠈⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⣏⢻⡿⠋⠭⡭⠭⣭⣭⣷⠀⢀",
          "  ⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⣾⣦⢡⣿⡀⣿⣿⣿⡆⠘⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⠸⣉⡉⠉⠓⠈⣿⠇⠀⣼",
          "  ⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡜⢿⣜⣻⠇⣿⣿⣿⣧⠀⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⢿⠀⠀⠀⠀⠘⠀⣰⣿",
          "  ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣦⣝⣇⢻⣿⣿⣿⡇⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢹⣦⣤⣴⣶⠏⡄⢠⣿⣿",
          "  ⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠘⣿⣿⣿⢱⣆⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⠷⢀⣿⣿⣿⢏⣼⡇⢸⣿⣿",
          "  ⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡏⣾⣿⡄⢻⣿⣿⣿⣿⠻⠿⣿⣿⣿⣿⣿⣯⣵⣶⣿⣿⣿⣿⢏⣾⣿⣇⠸⣿⣿",
          "  ⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⠈⠁⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣶⣶⣶⣤⣬⣙⠻⢿⣿⣿⡿⢃⣾⣿⣿⣿⡆⣿⣿",
          "  ⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡇⠀⣦⡙⠏⣸⣿⣿⣿⣿⣿⣿⣷⣬⣉⡛⢻⣿⣿⣾⣿⡟⠁⣾⣿⣿⣿⡿⠃⣿⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢸⡟⠀⢀⠙⠁⠀⣉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⣼⣿⣿⠟⢉⣤⣾⣿⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠁⠀⢀⣰⡟⡼⠢⠉⠻⢿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⣸⣿⣿⢋⣴⣿⣿⣿⣿⣿",
          "  ⠀⠀⠀⠀⠀⣀⣠⠀⠀⠀⠀⠈⠁⠀⠀⢀⣾⠐⣷⢃⣄⡙⠸⠿⢟⠇⠀⣠⡿⠖⣈⣉⠛⠟⠛⠁⠀⠀⠀⢰⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿",
          "  ⣀⡤⠀⠀⠁⠀⠠⠀⠈⠀⠀⠀⠀⠀⢀⣾⡟⣀⣢⣿⠟⣡⣆⠀⠊⠔⢀⣤⣶⣿⣿⠇⠀⠀⠀⠀⠀⠀⡀⢸⣿⣏⢸⣿⣿⣿⣿⣿⣿⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⢠⡿⢱⣿⠂⠀⡜⡟⠁⠁⣠⣶⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣇⢸⣿⣿⡌⣿⣿⣿⣿⣿⣿⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠀⡸⢣⣿⣿⣿⣆⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢠⣿⠈⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⢠⡀⠀⠟⠀⢿⣿⠏⢸⣿⠿⠿⠿⠿⠿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⢤⠜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿",
          "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢨⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢠⣴⣿⣿⣿⣿⣿"
        },
        opts = {
          position = "center",
          hl = "DashboardHeader",
        },
      }

      -- Data e hora na dashboard
      dashboard.section.datetime = {
        type = "text",
        val = function()
          return { os.date("  %d/%m/%Y  󰥔  %H:%M") }
        end,
        opts = {
          position = "center",
          hl = "Normal",
        },
      }

      -- Botões do menu
      dashboard.section.buttons.val = {
        dashboard.button("a", "󰈔  󱦰 New file", ":enew<CR>"),
        dashboard.button("f", "󰱼  󱦰 Find file", ":Telescope find_files<CR>"),
        dashboard.button("p", "  󱦰 Projects", ":Telescope find_files cwd=~/Documents/MeusProjetos<CR>"),
        dashboard.button("k", "  󱦰 Keymaps", ":Telescope keymaps<CR>"),
        dashboard.button("s", "  󱦰 Settings", ":Telescope find_files cwd=~/.config/nvim<CR>"),
        dashboard.button("q", "  󱦰 Quit NVIM", ":qa<CR>"),
      }

      -- Rodapé com estatísticas do Lazy
      dashboard.section.footer = {
        type = "text",
        val = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "Nyoom: Loaded " .. stats.loaded .. " packages in " .. ms .. "ms" }
        end,
        opts = {
          position = "center",
          hl = "DashboardFooter",
        },
      }

      -- Configuração do layout
      alpha.setup({
        layout = {
          { type = "padding", val = 2 },
          dashboard.section.header,
          { type = "padding", val = 1 },
          dashboard.section.datetime,
          { type = "padding", val = 2 },
          dashboard.section.buttons,
          { type = "padding", val = 1 },
          dashboard.section.footer,
        },
        opts = dashboard.opts,
      })
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- Definir highlights para a dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#78A9FF", bg = "#161616" }) -- Arte ASCII apagada
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#78A9FF", bg = "#161616" }) -- Rodapé apagado
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#f2f4f8", bg = "#161616" }) -- Labels dos botões brilhantes
vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = "#78A9FF", bg = "#161616" }) -- Atalhos apagados
vim.api.nvim_set_hl(0, "DashboardDatetime", { fg = "#f2f4f8", bg = "#161616" }) -- Data/hora brilhante

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Desativar a dashboard padrão do NvChad para usar o alpha.nvim
vim.opt.shortmess:append("I") -- Impede a mensagem inicial padrão

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