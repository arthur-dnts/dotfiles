return { 
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Initial dashboard configuration (Alpha.nvim)
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Header
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

      -- Date and time
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

      -- Menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("a", "󰈔  󱦰 New file", ":enew<CR>"),
        dashboard.button("f", "󰱼  󱦰 Find file", ":Telescope find_files<CR>"),
        dashboard.button("p", "  󱦰 Projects", ":Telescope find_files cwd=~/Documents/MeusProjetos<CR>"),
        dashboard.button("s", "  󱦰 Settings", ":Telescope find_files cwd=~/.config/nvim<CR>"),
        dashboard.button("k", "  󱦰 Keymaps", ":Telescope keymaps<CR>"),
        dashboard.button("q", "  󱦰 Quit NVIM", ":qa<CR>"),
      }

      -- Nyoom loaded packages
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

      -- Layout settings
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
}