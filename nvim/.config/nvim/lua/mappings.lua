require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- telescope keybindings
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- Sets Ctrl+P to "find_files"
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Sets Space+f+g to "live_grep"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Sets K to show "hover" information
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- sets g+d to go to definition

-- vim-tmux-navigator keybindings
local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", opts)
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", opts)
vim.keymap.set("n", "<C-\\>", "<Cmd>TmuxNavigatePrevious<CR>", opts)
