return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.cmd("colorscheme everforest")
      
      -- Change default background color
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1B2024" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1B2024" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1B2024" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#1B2024" })
    end,
  },
}
