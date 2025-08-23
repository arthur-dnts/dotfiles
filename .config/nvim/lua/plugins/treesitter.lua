return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Update languages after install
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "bash", "python", "javascript", "html", "css", "json",
        },
        highlight = {
          enable = true, -- Enable Treesitter highlight
        },
        indent = {
          enable = true, -- Smart indent
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<BS>",
          },
        },
      })
    end,
  },
}
