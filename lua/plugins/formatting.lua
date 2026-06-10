return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback", -- fall back to LSP formatting if no formatter
      },
      formatters_by_ft = {
        lua       = { "stylua" },
        python    = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- add more as needed
      },
    },
  },
}
