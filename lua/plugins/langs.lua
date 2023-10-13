return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")

            elixir.setup {
                nextls = { enable = true },
                credo = {},
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = false,
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                    end,
                }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
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
        "nvimtools/none-ls.nvim",
        optional = true,
        opts = function(_, opts)
            if vim.fn.executable("credo") == 0 then
                return
            end
            local nls = require("null-ls")
            opts.sources = opts.sources or {}
            vim.list_extend(opts.sources, {
                nls.builtins.diagnostics.credo,
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        optional = true,
        opts = function(_, opts)
            if vim.fn.executable("credo") == 0 then
                return
            end
            opts.linters_by_ft = {
                elixir = { "credo" },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "erlang",
                "elixir",
                "eex",
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
