return {
  -- pair closing 
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    --  TODO: move to keymaps
    'echasnovski/mini.surround',
    -- NOTE: visual mode!!
    opts = {
      mappings = {
        add = 'ca',
        delete = 'cd',
        find = 'cf',
        find_left = 'cF',
        highlight = 'ch',
        replace = 'cs',
        update_n_lines = 'cn',
      },
      n_lines = 20,
    },
  },
  -- commenter
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- TODO: https://github.com/Wansmer/treesj
  -- {
  --   'Wansmer/treesj',
  --   keys = { '<space>m', '<space>j', '<space>s' },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('treesj').setup({})
  --   end,
  -- },
}
