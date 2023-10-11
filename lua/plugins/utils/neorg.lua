return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    config = function()
      require("neorg").setup{
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            }
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.summary"] = {},
          ["core.ui.calendar"] = {},
          ["core.clipboard"] = {},
          ["core.dirman.utils"] = {},
          ["core.fs"] = {},
          ["core.highlights"] = {},
          ["core.integrations.nvim-cmp"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.telescope"] = {},
          ["core.integrations.zen_mode"] = {},
          ["core.mode"] = {},
          ["core.neorgcmd"] = {},
          ["core.neorgcmd.commands.module.list"] = {},
          ["core.neorgcmd.commands.module.load"] = {},
          ["core.neorgcmd.commands.return"] = {},
          ["core.queries.native"] = {},
          ["core.scanner"] = {},
          ["core.storage"] = {},
          ["core.syntax"] = {},
          ["core.tempus"] = {},
          ["core.ui"] = {},
        },
      }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  }
}
