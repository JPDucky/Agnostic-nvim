return {
  {
    'tools-life/taskwiki',
    lazy = false,
    dependencies = {
      'powerman/vim-plugin-AnsiEsc',
      'majutsushi/tagbar',
      'farseer90718/vim-taskwarrior',
    },
    init = function()
      vim.g.taskwiki_maplocalleader=","
    end,
  },
}
  -- { -- TODO:
  --   'chipsenkbeil/vimwiki-server.nvim',
  -- },
