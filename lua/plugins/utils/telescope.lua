return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'folke/noice.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'debugloop/telescope-undo.nvim' },
      {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {
          'nvim-telescope/telescope-file-browser.nvim'
        },
      },
    },
    opts = {
      --TODO: fix telescope-undo
      extensions = {
        undo = {},
        noice = {},
      },
      pickers = {
      },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.85,
            },
          noice = {},
          },
          fzf = {},
          project = {},
        }
      })

      -- TODO: move these keybinds to keybinds.lua
      -- 
      -- TODO: set the window to allow for movement up and down with 'h j k l'
      -- 
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension('project'))
      pcall(require('telescope').load_extension('undo'))
      pcall(require('telescope').load_extension('project'))
      pcall(require('telescope').load_extension('noice'))

      -- See `:help telescope.builtin`
      -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to telescope to change theme, layout, etc.
      --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
    end,
  },
}

