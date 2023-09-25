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
}
