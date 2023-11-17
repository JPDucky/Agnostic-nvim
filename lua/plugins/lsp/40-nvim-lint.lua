return {
  "mfussenegger/nvim-lint",
  enabled = false,
  config = function()
    require('lint').linters_by_ft = {
      lua = { 'selene' },
    }
  end,
}
