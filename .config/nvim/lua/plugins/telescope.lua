return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup()

      -- Map CTRL + SPACEBAR to open Telescope
      vim.keymap.set("n", "<C-Space>", require("telescope.builtin").find_files, { noremap = true, silent = true })
    end,
  },
}
