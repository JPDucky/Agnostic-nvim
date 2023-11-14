return {
  "Dhanus3133/LeetBuddy.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("leetbuddy").setup({
      domain = "com",
      language = 'py',
      keys = {
        select = "<CR>",
        reset = "<C-r>",
        easy = "<C-e>",
        medium = "<C-m>",
        hard = "<C-h>",
        accepted = "<C-a>",
        not_started = "<C-y>",
        tried = "<C-t>",
        page_next = "<C-l>",
        page_prev = "<C-h>",
      }
    })
  end,
  keys = {
    { "<leader>lcq", "<cmd>LBQuestions<cr>", desc = "List Questions"},
    { "<leader>lcl", "<cmd>LBQuestion<cr>", desc = "View Question"},
    { "<leader>lcr", "<cmd>LBReset<cr>", desc = "Reset Code"},
    { "<leader>lct", "<cmd>LBTest<cr>", desc = "Run Code"},
    { "<leader>lcs", "<cmd>LBSubmit<cr>", desc = "Submit Code"},
  },
}
