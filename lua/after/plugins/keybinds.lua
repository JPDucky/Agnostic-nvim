--NOTE: This file needs to be loaded last, otherwise the dependencies do not get loaded and it throws an error
-- which-key imports: (these need to be listed as dependencies for which-key)

--NOTE: Put references to any modules here if you want to use them in a keybind
 
local dap = require 'dap'
local dapui = require 'dapui'
local wk = require 'which-key'
local tele = require('telescope.builtin')
local bufferline = require('bufferline')


return {
  {
    'folke/which-key.nvim',
    event = "BufEnter",
    init = function()
      vim.o.timeout = true
      vim.o.timoutlen = 0
    end,
    opts = {
      window = {
        border = "single", -- none | single | double | shadow
        position = "top", -- bottom | top
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1 ,2 },
        windblend = 0,
        zindex = 1000,
      },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
        n = { "q", "@", "u", "v", "t", "s", "c" },
      },
      disable = { -- add buffers to disable wk in case it gets annoying
        buftypes = {},
        filetypes = {},
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = {"jk", "jj", "kk"}, --mappings for escaping insert mode
      timeout = 400,
      clear_empty_lines = true,
      keys = '<Esc>',
    },
  },
-- non-which-key keymaps:
  -- line bumpers
  -- vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Jump to window Left' }),
  -- vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Jump to window Right' }),
  -- vim.keymap.set('n', '<a-j>', '<C-w>j', { desc = 'Jump to window Down' }),
  -- vim.keymap.set('n', '<a-k>', '<C-w>k', { desc = 'Jump to window Up' }),

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
  -- navigation
  -- vim.keymap.set('i', 'jj', '<Esc>'),
  -- vim.keymap.set('i', 'kk', '<Esc>'),
  -- NOTE: Hold 'alt' to move around in insert mode
  -- basic moves
  vim.keymap.set('i', '<M-h>', '<C-o>h', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-l>', '<C-o>l', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-j>', '<C-o>j', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-k>', '<C-o>k', { noremap = true, silent = true }),

  -- basic hops
  vim.keymap.set('i', '<M-e>', '<C-o>e', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-b>', '<C-o>b', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-w>', '<C-o>w', { noremap = true, silent = true }),


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

      --NOTE: Any of the telescope functions can have its theme changed to get_dropdown | get_cursor | get_ivy
      g = {
        name = "+Git",
        c = { function() tele.git_commits(require('telescope.themes').get_dropdown({})) end, "Commits"},
        o = { function() tele.git_bcommits(require('telescope.themes').get_dropdown({})) end, "Buffer's Commits" },
        b = { function() tele.git_branches(require('telescope.themes').get_dropdown({})) end, "Branches w/ Log Preview" },
        s = { function() tele.git_status(require('telescope.themes').get_dropdown({})) end, "Show Current Changes" },
        h = { function() tele.git_stash(require('telescope.themes').get_dropdown({})) end, "Show Stash Items in Current Repo" },
        f = { function() tele.git_files(require('telescope.themes').get_dropdown({})) end, "Show files" },
      },

      l = {
        name = "+Lists", 
        b = { function() tele.builtin(require('telescope.themes').get_ivy({})) end, "Built-Ins" },
        d = { function() tele.diagnostics(require('telescope.themes').get_cursor({})) end, "List Diagnostics for all open Buffers" }, --NOTE: this may belong somewhere else
        h = { function() tele.help_tags(require('telescope.themes').get_dropdown({})) end, "List help tags" },
        j = { function() tele.jumplist(require('telescope.themes').get_cursor({})) end, "Jumplist" },
        l = {
          name = "+LSP Stuff",
          r = { function() tele.lsp_references(require('telescope.themes').get_cursor({})) end, "References" },
          i = { function() tele.lsp_incoming_calls(require('telescope.themes').get_cursor({})) end, "Incoming Calls for word Under Cursor" },
          o = { function() tele.lsp_outgoing_calls(require('telescope.themes').get_cursor({})) end, "Outgoing Calls for word Under Cursor" },
          d = { function() tele.lsp_document_symbols(require('telescope.themes').get_cursor({})) end, "List Document Symbols in Current Buffer" },
          w = { function() tele.lsp_workspace_symbols(require('telescope.themes').get_dropdown({})) end, "List Document Symbols in Current Workspace" },
          s = { function() tele.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({})) end, "Dynamically List LSP for all Workspace Symbols" },
        },
        m = { function() tele.marks(require('telescope.themes').get_dropdown({})) end, "List Marks" },
        p = {
          name = "+Pickers",
          h = { function() tele.resume(require('telescope.themes').get_dropdown({})) end, "Results of Previous Picker" },
          p = { function() tele.pickers(require('telescope.themes').get_dropdown({})) end, "Previous Pickers" },
        },
        },
        r = { function() tele.reloader(require('telescope.themes').get_dropdown({})) end, "Lua Modules (reloader)" },
        s = { function() tele.spell_suggest(require('telescope.themes').get_cursor({})) end, "Spelling Suggestions" },
        tb = { function() tele.current_buffer_tags(require('telescope.themes').get_dropdown({})) end, "Current Buffer Tags" }, --TODO: find new home
        tt = { function() tele.treesitter(require('telescope.themes').get_dropdown({})) end, "Treesitter Functions & Variables" },
        -- z = { function() tele.symbols{} end, "Symbols" },
      },

      p = {
        name = '+Personal',
      },

      q = {
        name = '+Quickfix',
        q = { function() tele.quickfix(require('telescope.themes').get_dropdown({})) end, "Quickfix" },
        h = { function() tele.quickfixhistory(require('telescope.themes').get_dropdown({})) end, "Quickfix History" },
        l = { function() tele.loclist(require('telescope.themes').get_dropdown({})) end, "Current Window Location List" },
      },

      s = {
        name = "+Search",
        f = { function() tele.find_files(require('telescope.themes').get_dropdown({})) end, 'Grep file' },
        -- s = { function() tele.grep_string{} end, 'Grep String' }, -- TODO: add to visual mode
        s = { function() tele.live_grep(require('telescope.themes').get_dropdown({})) end, 'Live Grep' },
        p = { function() tele.planets(require('telescope.themes').get_dropdown({})) end, "Search the planets..." },
        g = { function() tele.git_files(require('telescope.themes').get_dropdown({})) end, "Grep git" },
        c = { function() tele.current_buffer_fuzzy_find(require('telescope.themes').get_cursor({})) end, "Current Buffer" },
      },

      t = {
        name = '+Todo/Trouble',
        n = { function() require('todo-comments').jump_next() end, 'Next Todo comment' },
        p = { function() require('todo-comments').jump_prev() end, 'Previous Todo comment' },
        o = { function() require("trouble").open() end, "Open Trouble"},
        w = { function() require('trouble').open 'workspace_diagnostics' end, 'Workspace Diagnostics' },
        d = { function() require('trouble').open 'document_diagnostics' end, 'Document Diagnostics' },
        q = { function() require('trouble').open 'quickfix' end, 'Quickfix' },
        l = { function() require('trouble').open 'loclist' end, 'Location List' },
        r = { function() require('trouble').open 'lsp_references' end, 'LSP Reference List' },
      },

      u = {
        name = '+UI',
        n = { function() require('noice').cmd 'dismiss' end, 'Dismiss Notifications' },
        e = { function() require('noice').cmd 'errors' end, 'Show errors' },
        l = { function() require('noice').cmd 'last' end, 'Show last popup' },
        dn = { function() require('noice').cmd 'disable' end, 'Disable Noice' },
        en = { function() require('noice').cmd 'enable' end, 'Enable Noice' },
        s = { function() require('noice').cmd 'stats' end, 'Show Noice Debug Stats' },
        h = { function() require('noice').cmd 'telescope' end, 'Open message history in telescope' },
      },
      v = {
        name = "+Vim Locals",
        v = { function() tele.vim_options(require('telescope.themes').get_dropdown({})) end, "Vim Options" },
        r = { function() tele.registers(require('telescope.themes').get_ivy({})) end, "Registers" },
        a = { function() tele.autocommands(require('telescope.themes').get_ivy({})) end, "Autocommands" },
        k = { function() tele.keymaps(require('telescope.themes').get_ivy({})) end, "Keymaps" },
        f = { function() tele.filetypes(require('telescope.themes').get_dropdown({})) end, "Filetypes" },
        i = { function() tele.highlights(require('telescope.themes').get_dropdown({})) end, "Highlights" },
        c = { function() tele.commands(require('telescope.themes').get_dropdown({})) end, "List Cmd's" },
      },
    },
  }
