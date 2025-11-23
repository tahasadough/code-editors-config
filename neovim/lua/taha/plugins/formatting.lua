return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },

        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },

        lua = { "stylua" },

        python = { "isort", "black" },

        go = { "gofumpt", "goimports" },

        rust = { "rustfmt" },

        zig = { "zigfmt" },

        bash = { "shfmt" },
        sh = { "shfmt" },
        zsh = { "shfmt" },

        dockerfile = { "hadolint" },

        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },

        yaml = { "yamlfmt", "prettier" },

        toml = { "taplo" },

        sql = { "sqlfluff" },

        ["_"] = { "trim_whitespace" },
      },

      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        gofumpt = {
          prepend_args = { "-s" },
        },
        goimports = {
          prepend_args = { "-local", "your-module-prefix" },
        },
        yamlfmt = {
          prepend_args = { "-formatter", "retain_line_breaks=true" },
        },
        terraform_fmt = {
          command = "terraform",
          args = { "fmt", "-" },
          stdin = true,
        },
        zigfmt = {
          command = "zig",
          args = { "fmt", "--stdin" },
          stdin = true,
        },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },

      format_after_save = {
        lsp_fallback = true,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.api.nvim_create_user_command("ConformInfo", function()
      conform.info()
    end, { desc = "Show conform.nvim info" })
  end,
}
