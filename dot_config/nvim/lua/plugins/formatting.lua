return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local ft = vim.bo[bufnr].filetype
        return {
          timeout_ms = 1000,
          lsp_format = disable_filetypes[ft] and "never" or "fallback",
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        php = { "php_cs_fixer" },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "prettier",
        "goimports",
        "php-cs-fixer",
      },
    },
  },
}
