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
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup()

      vim.keymap.set("n", "<leader>mr", function()
        require("telescope").extensions.monorepo.monorepo()
      end)
      vim.keymap.set("n", "<leader>mrt", function()
        require("monorepo").toggle_project()
      end)
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
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
