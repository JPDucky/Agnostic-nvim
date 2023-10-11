return {
-- Themes
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
--   {
--     'ellisonleao/gruvbox.nvim',
--     priority = 1000,
-- },
}
