return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "eslint",
        "gopls",
        "rust_analyzer",
        "zls",
        "bashls",
        "angularls",
        "dockerls",
        "docker_compose_language_service",
        "yamlls",
        "ansiblels",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "gofumpt",
        "goimports",
        "golines",
        "staticcheck",
        "taplo",
        "codelldb",
        "shellcheck",
        "shfmt",
        "hadolint",
        "yamlfmt",
        "actionlint",
        "tflint",
        "marksman",
      },
    },
    dependencies = { "williamboman/mason.nvim" },
  },
}
