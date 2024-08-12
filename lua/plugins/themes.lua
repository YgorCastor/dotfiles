return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        plugins = {
          "dap",
          "dashboard",
          -- "gitsigns",
          -- "hop",
          "indent-blankline",
          "lspsaga",
          "mini",
          "neogit",
          -- "neorg",
          "nvim-cmp",
          "nvim-navic",
          -- "nvim-tree",
          "nvim-web-devicons",
          -- "sneak",
          "telescope",
          "trouble",
          "which-key",
        },
      })
      vim.g.material_style = "darker"
    end,
  },
  {
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
    config = function(_, opts)
      require("witch").setup(opts)
    end,
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flow",
    },
  },
}
