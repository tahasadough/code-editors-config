return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
    { "folke/trouble.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      local function map(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true })
      end
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "<C-k>", vim.lsp.buf.signature_help)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end)
    end

    local servers = {
      ts_ls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      svelte = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      },
      graphql = {},
      emmet_ls = {},
      prismals = {},
      pyright = {},
      eslint = {},
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            analyses = { unusedparams = true },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            assist = { importGranularity = "module" },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
      zls = {},
      bashls = {},
      angularls = {},
      dockerls = {},
      docker_compose_language_service = {},
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
              kubernetes = "*.k8s.yaml",
            },
          },
        },
      },
      ansiblels = {},
    }

    for name, config in pairs(servers) do
      vim.lsp.config(
        name,
        vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config)
      )
    end
  end,
}
