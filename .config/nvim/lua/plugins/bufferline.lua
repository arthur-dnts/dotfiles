return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", separator = true },
        },
        separator_style = "slant", --"slant", "thin" or "padded_slant"
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })

    -- Map ALT + NUMBER to change current tab
    for i = 1, 9 do
      vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
    end

    -- Map CTRL + W to close current tab
    vim.keymap.set("n", "<C-w>", "<Cmd>bdelete<CR>", { noremap = true, silent = true })
  end,
}
