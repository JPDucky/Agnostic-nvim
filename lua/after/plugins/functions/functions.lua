local dap = require 'dap'
local dapui = require 'dapui'
local tele = require('telescope.builtin')
local bufferline = require('bufferline')
local wk = require('which-key')

local function telescope_project_keys()
  require('telescope').extensions.project.project{ display_type = 'full' }
  wk.show({
    d = { "Delete Project" },
    r = { "Rename Project" },
    c = { "Add Project" },
    C = { "Add Project CWD" },
    f = { "Find Project" },
    b = { "Browse Project Files" },
    s = { "Search in Project Files" },
    R = { "Recent Project Files" },
    w = { "Change Working Directory" },
  }, "Project" )
end

local mappings = {
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
        a = { vim.lsp.buf.code_action, "Action" },
        t = { vim.lsp.buf.type_definition, "Type Definition" },
      },

      d = {
        name = '+Debug',
        d = { dapui.toggle, 'DAP UI Toggle' },
        f = { dap.continue, 'Debug: Start/Continue' },
        i = { dap.step_into, 'Debug: Step Into' },
        o = { dap.step_over, 'Debug: Step Over' },
        O = { dap.step_out, 'Debug: Step Out' },
        t = { dap.toggle_breakpoint, 'Debug: Toggle Breakpoint' },
        b = { function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, 'Debug: Set Breakpoint' },
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
        -- c = { function() tele.git_commits(require('telescope.themes').get_dropdown({})) end, "Commits"},
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
          N = { function() tele.pickers(require('telescope.themes').get_dropdown({})) end, "Previous Pickers" },
        },

        s = { function() tele.spell_suggest(require('telescope.themes').get_cursor({})) end, "Spelling Suggestions" },-- r = { function() tele.reloader(require('telescope.themes').get_dropdown({})) end, "Lua Modules (reloader)" },  -- TODO: Figure out what is hijacking keybinds here
        tb = { function() tele.current_buffer_tags(require('telescope.themes').get_dropdown({})) end, "Current Buffer Tags" }, --TODO: find new home
        tt = { function() tele.treesitter(require('telescope.themes').get_dropdown({})) end, "Treesitter Functions & Variables" },
        z = { function() tele.symbols{} end, "Symbols" },
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

      r = {
        n = { vim.lsp.buf.rename, "rename" },
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
        name = '+Trouble/TODO',
        n = { function() require('todo-comments').jump_next() end, 'Next TODO' },
        N = { function() require('todo-comments').jump_prev() end, 'Previous TODO' },
        T = { '<Cmd>TodoTrouble<CR>', "TodoTrouble" },
        L = { '<Cmd>TodoTelescope<CR>', "TodoTelescope" },
        t = { function() require("trouble").open() end, "Open Trouble"},
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
        D = { function() require('noice').cmd 'disable' end, 'Disable Noice' },
        E = { function() require('noice').cmd 'enable' end, 'Enable Noice' },
        s = { function() require('noice').cmd 'stats' end, 'Show Noice Debug Stats' },
        h = { function() require('noice').cmd 'telescope' end, 'Open message history in telescope' },
        u = { function() require('telescope').extensions.undo.undo() end, "undo tree" },
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

      w = {
        name = "+Workspace",
        a = { vim.lsp.buf.add_workspace_folder, "Add Folder to workspace" },
        r = { vim.lsp.buf.remove_workspace_folder, "Remove Folder to workspace" },
        l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders'},
        p = { vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "telescope-project",
          callback = function()
            require('telescope').extensions.project.project{ display_type = 'full' }
            wk.show({
              d = { "Delete Project" },
              r = { "Rename Project" },
              c = { "Add Project" },
              C = { "Add Project CWD" },
              f = { "Find Project" },
              b = { "Browse Project Files" },
              s = { "Search in Project Files" },
              R = { "Recent Project Files" },
              w = { "Change Working Directory" },
            })
          end
        }), "Project" },
        -- p = { function() require('telescope').extensions.project.project{ display_type = 'full' } end, "Project Interface" },
      },
      ["?"] = { function() tele.oldfiles() end, "Show Recent Files" },
      ["<space>"] = { function() tele.buffers() end, "Find Existing Buffers" },
      ["/"] = { function() tele.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false })) end, "Search Current Buffer (Fuzzy)" },
      --end leader setup
    }
  }

-- local leaderless_keys = {
--   [""] = {
--     g = {
--       t = {
--         name = "goto telescope",
--         i = { function() tele.lsp_implementations{} end, "Go-To Implementation" },
--         d = { function() tele.lsp_definitions{} end, "Go-To Definition" },
--         t = { function() tele.lsp_type_definitions{} end, "Go-To Type Definition" },
--       },
--       d = { vim.lsp.buf.definition, "Goto Definition" },
--       D = { vim.lsp.buf.declaration, "Goto declaration" },
--       r = { function() tele.lsp_references() end, "Goto References" },
--       I = { function() tele.lsp_implementations() end, "Goto References" },
--       --TODO: handle 'g' maps to avoid clutter
--     },
--     f = { function() require('flash').treesitter() end, "Flash Treesitter" },
--     -- K = { vim.lsp.buf.hover, "Hover Documentation" },
--     -- ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature Documentation" },
--     ["<M-H>"] = { vim.lsp.buf.hover, "Hover Documentation" },
--   }
-- }

return {
  default = mappings,
  project = telescope_project_keys
}
