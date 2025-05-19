-- configure plugins
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- Sets Ctrl+P to "find_files"
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Sets Space+f+g to "live_grep"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Sets K to show "hover" information
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- sets g+d to go to definition

-- load plugins
return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  require ("plugins.treesitter"),
  require("plugins.telescope"),
}
