--  NOTE: This file needs to be loaded last, otherwise the dependencies do not get loaded and it throws an error

-- which-key imports: (these need to be listed as dependencies for which-key)

--  NOTE: Put references to any modules here if you want to use them in a keybind
local dap = require 'dap'
local dapui = require 'dapui'
local tele = require('telescope.builtin')
local bufferline = require('bufferline')
local wk = require 'which-key'

local functions_module = require('after.plugins.functions.functions')

-- local mappings = functions_module.default
-- local project_keys = functions_module.project


-- this feels most natural
vim.o.timeout = true
vim.o.timeoutlen = 550

return {
  {
    'folke/which-key.nvim',
    event = "BufEnter",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 30
    end,
    opts = {
      window = {
        border = "single",   -- none | single | double | shadow
        position = "bottom", -- bottom | top
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1, 2 },
        windblend = 0,
        zindex = 1000,
      },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
        n = { "q", "@", "u", "t", "s", "c", "h", "j", "k", "l", "o" },
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj", "kk" }, --mappings for escaping insert mode
      timeout = 400,
      clear_empty_lines = true,
      keys = '<Esc>',
    },
  },

  --  TODO: Move these::
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
  --
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

  -- Diagnostic keymaps
  --vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  --vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  --vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
  --vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

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

  -- basic operations
  vim.keymap.set('i', '<M-o>', '<C-o>o', { noremap = true, silent = true }),
  vim.keymap.set('i', '<M-O>', '<C-o>O', { noremap = true, silent = true }),

  --NOTE: setup functions here, define them below

  -- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  --   keybinds.map_event_to_mode("norg", {
  --     n = {
  --       { "<C-s>", "core.integrations.telescope.find_linkable" },
  --     },
  --
  --     i = {
  --       { "<C-l>", "core.integrations.telescope.insert_link" },
  --     },
  --   }, {
  --     silent = true,
  --     noremap = true,
  --   })
  -- end)


  -- NOTE: which-key bindings
  -- All of these bindings are prefaced with the leader key, more to come

  wk.register {
    ['<leader>'] = {
      a = {
        name = '+[A]ctions',
      },

      b = {
        name = '+[B]uffer',
        d = "Delete Current Buff",           --lazy, see file
        D = "Delete Current Buffer (Force)", -- lazy, see file
        g = { bufferline.pick, "Select Buffer" },
        c = { bufferline.close_with_pick, "Close Select Buffer" },
      },

      c = {
        name = '+[C]ode',
        a = { vim.lsp.buf.code_action, "Action" },
        t = { vim.lsp.buf.type_definition, "Type Definition" },
      },

      d = {
        name = '+[D]ebug',
        d = { dapui.toggle, 'DAP UI Toggle' },
        f = { dap.continue, 'Debug: Start/Continue' },
        i = { dap.step_into, 'Debug: Step Into' },
        o = { dap.step_over, 'Debug: Step Over' },
        O = { dap.step_out, 'Debug: Step Out' },
        t = { dap.toggle_breakpoint, 'Debug: Toggle Breakpoint' },
        b = { function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, 'Debug: Set Breakpoint' },
      },

      e = {
        name = "+[E]ditor",
        c = { function() tele.colorscheme {} end, "Select colorscheme" }
      },

      f = {
        name = '+[F]ile',
        s = { '<Cmd>w<CR><Esc>', 'File Save' },
        r = { function() tele.oldfiles() end, "Show Recent Files" },
        f = { function() vim.lsp.buf.format({ async = true }) end, "Format File" },
      },

      g = {
        name = "+[G]rep",
        -- s = { function() tele.grep_string{} end, 'Grep String' }, -- TODO: add to visual mode
        c = { function() tele.current_buffer_fuzzy_find(require('telescope.themes').get_cursor({})) end, "Current Buffer" },
        f = { function() tele.find_files(require('telescope.themes').get_dropdown({})) end, 'Grep file' },
        p = { function() tele.planets(require('telescope.themes').get_dropdown({})) end, "Search the planets..." },
        s = { function() tele.live_grep(require('telescope.themes').get_dropdown({})) end, 'Live Grep' },
      },

      --NOTE: Any of the telescope functions can have its theme changed to get_dropdown | get_cursor | get_ivy
      G = {
        name = "+[G]it",
        -- c = { function() tele.git_commits(require('telescope.themes').get_dropdown({})) end, "Commits"},
        o = { function() tele.git_bcommits(require('telescope.themes').get_dropdown({})) end, "Buffer's Commits" },
        b = { function() tele.git_branches(require('telescope.themes').get_dropdown({})) end, "Branches w/ Log Preview" },
        s = { function() tele.git_status(require('telescope.themes').get_dropdown({})) end, "Show Current Changes" },
        h = { function() tele.git_stash(require('telescope.themes').get_dropdown({})) end, "Show Stash Items in Current Repo" },
        f = { function() tele.git_files(require('telescope.themes').get_dropdown({})) end, "Grep git files" },
      },

      h = {
        name = "+[H]elp",
        h = { function() tele.help_tags(require('telescope.themes').get_dropdown({})) end, "Search Help Files" },
        c = { function() tele.commands(require('telescope.themes').get_dropdown({})) end, "List Available Plugin/User Commands" },
      },

      l = {
        name = "+[L]ists",
        b = { function() tele.builtin(require('telescope.themes').get_ivy({})) end, "Built-Ins" },
        d = { function() tele.diagnostics(require('telescope.themes').get_cursor({})) end, "List Diagnostics for all open Buffers" }, --NOTE: this may belong somewhere else
        j = { function() tele.jumplist(require('telescope.themes').get_cursor({})) end, "Jumplist" },
        l = {
          name = "+[L]SP Stuff",
          r = { function() tele.lsp_references(require('telescope.themes').get_cursor({})) end, "References" },
          i = { function() tele.lsp_incoming_calls(require('telescope.themes').get_cursor({})) end, "Incoming Calls for word Under Cursor" },
          o = { function() tele.lsp_outgoing_calls(require('telescope.themes').get_cursor({})) end, "Outgoing Calls for word Under Cursor" },
          d = { function() tele.lsp_document_symbols(require('telescope.themes').get_cursor({})) end, "List Document Symbols in Current Buffer" },
          w = { function() tele.lsp_workspace_symbols(require('telescope.themes').get_dropdown({})) end, "List Document Symbols in Current Workspace" },
          s = { function() tele.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({})) end, "Dynamically List LSP for all Workspace Symbols" },
        },
        m = { function() tele.marks(require('telescope.themes').get_dropdown({})) end, "List Marks" },
        p = {
          name = "+[P]ickers",
          h = { function() tele.resume(require('telescope.themes').get_dropdown({})) end, "Results of Previous Picker" },
          N = { function() tele.pickers(require('telescope.themes').get_dropdown({})) end, "Previous Pickers" },
        },

        s = { function() tele.spell_suggest(require('telescope.themes').get_cursor({})) end, "Spelling Suggestions" },         -- r = { function() tele.reloader(require('telescope.themes').get_dropdown({})) end, "Lua Modules (reloader)" },  -- TODO: Figure out what is hijacking keybinds here
        tb = { function() tele.current_buffer_tags(require('telescope.themes').get_dropdown({})) end, "Current Buffer Tags" }, --TODO: find new home
        tt = { function() tele.treesitter(require('telescope.themes').get_dropdown({})) end, "Treesitter Functions & Variables" },
        z = { function() tele.symbols {} end, "Symbols" },
        w = {
          name = "+[W]orkspace",
          a = { vim.lsp.buf.add_workspace_folder, "Add Folder to workspace" },
          r = { vim.lsp.buf.remove_workspace_folder, "Remove Folder to workspace" },
          l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders' },
          p = { function() require('telescope').extensions.project.project { display_type = 'full' } end, "Project Interface" },
        },
      },

      p = {
        name = '+[P]ersonal',
      },

      q = {
        name = '+[Q]uickfix',
        q = { function() tele.quickfix(require('telescope.themes').get_dropdown({})) end, "Quickfix" },
        h = { function() tele.quickfixhistory(require('telescope.themes').get_dropdown({})) end, "Quickfix History" },
        l = { function() tele.loclist(require('telescope.themes').get_dropdown({})) end, "Current Window Location List" },
      },

      r = {
        n = { vim.lsp.buf.rename, "rename" },
      },

      t = {
        name = '+[T]rouble/TODO',
        n = { function() require('todo-comments').jump_next() end, 'Next TODO' },
        N = { function() require('todo-comments').jump_prev() end, 'Previous TODO' },
        T = { '<Cmd>TodoTrouble<CR>', "TodoTrouble" },
        L = { '<Cmd>TodoTelescope<CR>', "TodoTelescope" },
        t = { function() require("trouble").open() end, "Open Trouble" },
        w = { function() require('trouble').open 'workspace_diagnostics' end, 'Workspace Diagnostics' },
        d = { function() require('trouble').open 'document_diagnostics' end, 'Document Diagnostics' },
        q = { function() require('trouble').open 'quickfix' end, 'Quickfix' },
        l = { function() require('trouble').open 'loclist' end, 'Location List' },
        r = { function() require('trouble').open 'lsp_references' end, 'LSP Reference List' },
      },

      u = {
        name = '+[U]I',
        n = { function() require('noice').cmd 'dismiss' end, 'Dismiss Notifications' },
        e = { function() require('noice').cmd 'errors' end, 'Show errors' },
        l = { function() require('noice').cmd 'last' end, 'Show last popup' },
        t = { function() require('noice').cmd 'disable' end, 'Toggle Notifications' },
        E = { function() require('noice').cmd 'enable' end, 'Enable Noice' },
        s = { function() require('noice').cmd 'stats' end, 'Show Noice Debug Stats' },
        h = { function() require('telescope').extensions.noice.noice(require('telescope.themes').get_dropdown({})) end,

          'Open message history in telescope' },
        u = { "<Cmd>UndotreeToggle<CR>", "Undotree" }, 
      },
      v = {
        name = "+[V]im Locals",
        v = { function() tele.vim_options(require('telescope.themes').get_dropdown({})) end, "Vim Options" },
        r = { function() tele.registers(require('telescope.themes').get_ivy({})) end, "Registers" },
        a = { function() tele.autocommands(require('telescope.themes').get_ivy({})) end, "Autocommands" },
        k = { function() tele.keymaps(require('telescope.themes').get_ivy({})) end, "Keymaps" },
        f = { function() tele.filetypes(require('telescope.themes').get_dropdown({})) end, "Filetypes" },
        i = { function() tele.highlights(require('telescope.themes').get_dropdown({})) end, "Highlights" },
      },

      w = {
        name = "+[W]orkspace",
      },
      ["?"] = { function() tele.oldfiles() end, "Show Recent Files" },
      ["<space>"] = { function() tele.buffers() end, "Find Existing Buffers" },
      ["/"] = { function() tele.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false })) end, "Search Current Buffer (Fuzzy)" },
      --end leader setup
    },

    ['<A-i>'] = { "<Cmd>FloatermToggle<CR>", "Float-Term Toggle" },
    -- TODO: figure out what to do with these for window hopping easily
    -- ["<C-h>"] = { '<C-w>h' },
    -- ["<C-j>"] = { '<C-w>j' },
    -- ["<C-k>"] = { '<C-w>k' },
    -- ["<C-l>"] = { '<C-w>l' },

    --  NOTE: here are the leader-less keybinds
    [""] = {
      g = {
        t = {
          name = "goto telescope",
          i = { function() tele.lsp_implementations {} end, "Go-To Implementation" },
          d = { function() tele.lsp_definitions {} end, "Go-To Definition" },
          t = { function() tele.lsp_type_definitions {} end, "Go-To Type Definition" },
        },
        d = { vim.lsp.buf.definition, "Goto Definition" },
        D = { vim.lsp.buf.declaration, "Goto declaration" },
        r = { function() tele.lsp_references() end, "Goto References" },
        I = { function() tele.lsp_implementations() end, "Goto References" },
        --TODO: handle 'g' maps to avoid clutter
      },
      f = { function() require('flash').treesitter() end, "Flash Treesitter" },
    }
  }
}
