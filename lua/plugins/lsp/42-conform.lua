return {
  'stevearc/conform.nvim',
  enabled = false,
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { 'selene' },
        python = { 'black' },
        javascript = { { "prettierd", "prettier" } },
      }
    })
  end
}
