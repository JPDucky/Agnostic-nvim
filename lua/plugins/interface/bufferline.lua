return {
  --TODO: add to editor-ui.lua
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    -- these 'keys' are lazy loaded, as in the plugin isn't loaded until these keys are used
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "nil",
        separator_style = "slant", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
        diagnostics = "nvim_lsp", -- "coc"
        always_show_bufferline = false,
        sort_by = 'insert_after_current', -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs',
        offsets = {
          {
            filetype = "Undotree",
            text = "Undo History",
            highlight = "",
            separator = true
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Current Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Current Buffer -Force"},
    }
  },
}
