return {
  'AlphaTechnolog/pywal.nvim',
  config = function()
    require('pywal').setup({

    })
    require('lualine').setup({
      options = {
        theme = 'pywal-nvim'
      }
    })
  end,
}
