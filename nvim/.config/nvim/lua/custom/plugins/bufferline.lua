return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'filesystem',
            highlight = 'Directory',
            separator = false,
          },
        },
      },
    }

    -- Custom keymaps
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', '<C-w>c', '<Cmd>bdelete<CR>', { desc = 'Close current buffer' })
  end,
}
