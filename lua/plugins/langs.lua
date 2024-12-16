return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = {
        elixir = { "credo" },
      }

      opts.linters = {
        credo = {
          condition = function(ctx)
            return vim.fs.find({ ".credo.exs" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.mix.with({
          cwd = function()
            -- Use Neovim's current working directory
            return vim.fn.getcwd()
          end,
          extra_args = function()
            local cwd = vim.fn.getcwd()
            local formatter_path = cwd .. "/.formatter.exs"
            vim.notify(formatter_path)

            if vim.fn.filereadable(formatter_path) == 1 then
              return { "--dot-formatter", formatter_path }
            end
            return {}
          end,
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lexical = {
          on_attach = function(client, bufnr)
            -- Disable Lexical’s formatting capabilities
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "erlang",
        "elixir",
        "eex",
        "graphql",
        "go",
        "heex",
        "hcl",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "zig",
      },
    },
  },
}
