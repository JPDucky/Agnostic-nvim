return {
  -- pair closing 
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'gca',
        delete = 'gcd',
        find = 'gcf',
        find_left = 'gcF',
        highlight = 'gch',
        replace = 'gcs',
        update_n_lines = 'gcn',
      },
      n_lines = 20,
    },
  },
  -- commenter
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}
