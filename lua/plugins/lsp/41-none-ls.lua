return {
  'nvimtools/none-ls.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require('null-ls')

    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover
    local completion = null_ls.builtins.completion

    require('null-ls').setup({
      sources = {
        code_actions.gitsigns,
        code_actions.eslint.with({
          filetypes = {},
        }),
        -- code_actions.elsint_d,
        -- code_actions.cspell,
        -- diagnostics.cspell,
        formatting.stylua,
        diagnostics.eslint,
        completion.spell,
      }
    })
  end,
  enabled = false,
}
