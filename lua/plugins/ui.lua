return {
  {
    "s1n7ax/nvim-terminal",
    config = function()
      vim.o.hidden = true
      require("nvim-terminal").setup({
        toggle_keymap = "<C-n>t",
      })
    end,
  },
  {
    "willothy/wezterm.nvim",
    config = true,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup({
        has_breadcrumbs = false,
        watermark = "",
        save_path = "~/Pictures",
      })
    end,
  },
  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require("lsp-lens").setup({})
    end,
  },
  { "akinsho/bufferline.nvim", enabled = false },
}
