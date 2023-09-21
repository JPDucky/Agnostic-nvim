--NOTE: This file needs to be loaded last, otherwise the dependencies do not get loaded and it throws an error
-- which-key imports: (these need to be listed as dependencies for which-key)

--NOTE: Put references to any modules here if you want to use them in a keybind

local dap = require 'dap'
local dapui = require 'dapui'
local wk = require 'which-key'
local tele = require('telescope.builtin')
local bufferline = require('bufferline')


return {
  { 'folke/which-key.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui'
    },
    event = "BufEnter",
  },
  opts = {
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
  },
-- non-which-key keymaps:
  -- line bumpers
  vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Jump to window Left' }),
  vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Jump to window Right' }),
  vim.keymap.set('n', '<a-j>', '<C-w>j', { desc = 'Jump to window Down' }),
  vim.keymap.set('n', '<a-k>', '<C-w>k', { desc = 'Jump to window Up' }),

  vim.keymap.set('n', '<A-K>', '<Cmd>m .-2<CR>==', { desc = 'Move Line Up' }),
  vim.keymap.set('i', '<A-K>', '<Esc><Cmd>m .-2<CR>==gi', { desc = 'Move Line Up' }),
  vim.keymap.set('v', '<A-K>', ":m '<-2<CR>gv=gv'", { desc = 'Move Line Up' }),
  vim.keymap.set('n', '<A-J>', '<Cmd>m .+1<CR>==', { desc = 'Move Line Down' }),
  vim.keymap.set('i', '<A-J>', '<Esc><Cmd>m .+1<CR>==gi', { desc = 'Move Line Down' }),
  vim.keymap.set('v', '<A-J>', ":m '>+1<CR>gv=gv'", { desc = 'Move Line Down' }),

  -- Clear search highlighting with Escape
  vim.keymap.set({ 'i', 'n' }, '<Esc>', '<Cmd>noh<CR><Esc>', { desc = 'Escape and clear hlsearch' }),

  -- Undo Breakpoints
  vim.keymap.set('i', ',', ',<C-g>u'),
  vim.keymap.set('i', '.', '.<C-g>u'),
  vim.keymap.set('i', ';', ';<C-g>u'),
  vim.keymap.set('i', ')', ')<C-g>u'),

  -- Better Indents in visual mode
  vim.keymap.set('v', '<', '<gv'),
  vim.keymap.set('v', '>', '>gv'),

  -- Lazy UI
  vim.keymap.set('n', '<leader>ll', '<Cmd>Lazy<CR>', { desc = 'Lazy UI' }),

  -- netrw
  vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = 'netrw' }),

  -- harpoon
  -- local mark = require("harpoon.mark")
  -- local ui = require("harpoon.ui")
  -- vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to Harpoon" })
  -- vim.keymap.set("n", "<leader>pe", ui.toggle_quick_menu, { desc = "Harpoon" })

  -- navigation
  vim.keymap.set('i', 'jj', '<Esc>'),
  vim.keymap.set('i', 'kk', '<Esc>'),
  --vim.keymap.set("i", "lll", "<Esc>")
  --vim.keymap.set("i", "hh", "<Esc>")

  -- undo tree
  -- vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

  -- telescope
  --vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
  --vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git Files" })

  -- telescope undo
  -- vim.keymap.set('n', '<leader>uu', '<cmd>Telescope undo<cr>'),

  -- quick yoink
  vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yoink to System Clipboard' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+p', { desc = 'Plop from System Clipboard' }),

  --buffers
  vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Buffer Left" }),
  vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Buffer Right" }),
  -- vim.keymap.set("n", "<leader>bg", "<Cmd>BufferLinePick<CR>", { desc = "Goto Buffer _n" }),
  -- vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Close Buffer _n" }),
  --
  -- copilot
  -- local copilot_on = true
  -- vim.api.nvim_create_user_command("CopilotToggle", function()
  --   if copilot_on then
  --     vim.cmd("Copilot disable")
  --     print("Copilot OFF")
  --   else
  --     vim.cmd("Copilot enable")
  --     print("[Copilot] Online")
  --   end
  --   copilot_on = not copilot_on
  -- end, { nargs = 0 })
  -- vim.keymap.set("n", "<leader>ct", ":CopilotToggle<CR>", { desc = "Copilot Toggle" })

  -- NOTE: which-key bindings
  -- All of these bindings are prefaced with the leader key, more to come
  wk.register {
    g = {
      name = "goto",
      i = { function() tele.lsp_implementations{} end, "Go-To Implementation" },
      d = { function() tele.lsp_definitions{} end, "Go-To Definition" },
      t = { function() tele.lsp_type_definitions{} end, "Go-To Type Definition" },
      --TODO: handle 'g' maps to avoid clutter
    },
    ['<leader>'] = {

      a = {
        name = '+Actions',
      },

      b = {
        name = '+Buffer',
        d = "Delete Current Buff", --lazy, see file
        D = "Delete Current Buffer (Force)", -- lazy, see file
        g = { bufferline.pick, "Select Buffer" },
        c = { bufferline.close_with_pick, "Close Select Buffer" },
      },

      c = {
        name = '+Code',
      },

      d = {
        name = '+Debug',
        d = { dapui.toggle, 'DAP UI Toggle' },
        f = { dap.continue, 'Debug: Start/Continue' },
        i = { dap.step_into, 'Debug: Step Into' },
        o = { dap.step_over, 'Debug: Step Over' },
        O = { dap.step_out, 'Debug: Step Out' },
        t = { dap.toggle_breakpoint, 'Debug: Toggle Breakpoint' },
        b = {
          function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end,
          'Debug: Set Breakpoint',
        },
      },

      e = {
        name = "+Editor",
        c = { function() tele.colorscheme{} end, "Select colorscheme"}
      },

      f = {
        name = '+File',
        s = { '<Cmd>w<CR><Esc>', 'File Save' },
      },

      g = {
        name = '+Grep/Git',
        f = { function() tele.find_files{} end, 'Grep file' },
        -- s = { function() tele.grep_string{} end, 'Grep String' }, -- TODO: add to visual mode
        s = { function() tele.live_grep{} end, 'Live Grep' },
        p = { function() tele.planets{} end, "Search the planets..." },
        g = { function() tele.git_files{} end, "Grep git" },
        c = { function() tele.current_buffer_fuzzy_find{} end, "Current Buffer" },
      },

      l = {
        name = "+Lists",
        b = { function() tele.builtin{} end, "Built-ins" },
        d = { function() tele.diagnostics{} end, "List Diagnostics for all open Buffers" }, --NOTE: this may belong somewhere else
        g = {
          name = "+Git Lists",
          c = { function() tele.git_commits{} end, "Commits"},
          o = { function() tele.git_bcommits{} end, "Buffer's Commits" },
          b = { function() tele.git_branches{} end, "Branches w/ Log Preview" },
          s = { function() tele.git_status{} end, "Show Current Changes" },
          h = { function() tele.git_stash{} end, "Show Stash Items in Current Repo" },
          f = { function() tele.git_files{} end, "Show files" },
        },
        h = { function() tele.help_tags{} end, "List help tags" },
        j = { function() tele.jumplist{} end, "Jumplist" },
        l = {
          name = "+LSP Stuff",
          r = { function() tele.lsp_references{} end, "References" },
          i = { function() tele.lsp_incoming_calls{} end, "Incoming Calls for word Under Cursor" },
          o = { function() tele.lsp_outgoing_calls{} end, "Outgoing Calls for word Under Cursor" },
          d = { function() tele.lsp_document_symbols{} end, "List Document Symbols in Current Buffer" },
          w = { function() tele.lsp_workspace_symbols{} end, "List Document Symbols in Current Workspace" },
          s = { function() tele.lsp_dynamic_workspace_symbols{} end, "Dynamically List LSP for all Workspace Symbols" },
        },
        m = { function() tele.marks{} end, "List Marks" },
        p = {
          name = "+Pickers",
          h = { function() tele.resume{} end, "Results of Previous Picker" },
          p = { function() tele.pickers{} end, "Previous Pickers" },
        },
        q = {
          --TODO: add handling for when the quicklist is empty
          name = "+Quickfix",
          q = { function() tele.quickfix{} end, "Quickfix" },
          h = { function() tele.quickfixhistory{} end, "Quickfix History" },
          l = { function() tele.loclist{} end, "Current Window Location List" },
        },
        r = { function() tele.reloader{} end, "Lua Modules (reloader)" },
        s = { function() tele.spell_suggest{} end, "Spelling Suggestions" },
        tb = { function() tele.current_buffer_tags{} end, "Current Buffer Tags" }, --TODO: find new home
        tt = { function() tele.treesitter{} end, "Treesitter Functions & Variables" },
        v = {
          name = "+Vim Locals",
          v = { function() tele.vim_options{} end, "Vim Options" },
          r = { function() tele.registers{} end, "Registers" },
          a = { function() tele.autocommands{} end, "Autocommands" },
          k = { function() tele.keymaps{} end, "Keymaps" },
          f = { function() tele.filetypes{} end, "Filetypes" },
          i = { function() tele.highlights{} end, "Highlights" },
          c = { function() tele.commands{} end, "List Cmd's" },
        },
        -- z = { function() tele.symbols{} end, "Symbols" },
      },

      -- o = {
      --   name = "options",
      -- },
      --
      p = {
        name = '+Personal',
      },

      q = {
        name = '+Quit',
        q = { '<Cmd>qa<CR>', 'Quit All' },
      },

      t = {
        name = '+Todo/Trouble',
        n = {
          function()
            require('todo-comments').jump_next()
          end,
          'Next Todo comment',
        },
        p = {
          function()
            require('todo-comments').jump_prev()
          end,
          'Previous Todo comment',
        },
        -- o = { function() require("trouble").open() end, "Open Trouble"},
        w = {
          function()
            require('trouble').open 'workspace_diagnostics'
          end,
          'Workspace Diagnostics',
        },
        d = {
          function()
            require('trouble').open 'document_diagnostics'
          end,
          'Document Diagnostics',
        },
        q = {
          function()
            require('trouble').open 'quickfix'
          end,
          'Quickfix',
        },
        l = {
          function()
            require('trouble').open 'loclist'
          end,
          'Location List',
        },
        r = {
          function()
            require('trouble').open 'lsp_references'
          end,
          'LSP Reference List',
        },
      },

      u = {
        name = '+UI',
        n = {
          function()
            require('noice').cmd 'dismiss'
          end,
          'Dismiss Notifications',
        },
        e = {
          function()
            require('noice').cmd 'errors'
          end,
          'Show errors',
        },
        l = {
          function()
            require('noice').cmd 'last'
          end,
          'Show last popup',
        },
        dn = {
          function()
            require('noice').cmd 'disable'
          end,
          'Disable Noice',
        },
        en = {
          function()
            require('noice').cmd 'enable'
          end,
          'Enable Noice',
        },
        s = {
          function()
            require('noice').cmd 'stats'
          end,
          'Show Noice Debug Stats',
        },
        h = {
          function()
            require('noice').cmd 'telescope'
          end,
          'Open message history in telescope',
        },
      },
      -- w = {
      --   name = "window",
      -- },
      -- x = {
      --   name = "",
      -- },
    },
  },
}
