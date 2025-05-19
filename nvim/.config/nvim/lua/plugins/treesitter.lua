-- github: https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
     "html", "css", "rust"
    },
  },
  build = ":TSUpdate",
}
