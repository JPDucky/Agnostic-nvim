local wk = require('which-key')
return {
  wk.register({

    n = {
      ['<localleader>'] = {

        a = { "<Cmd>TaskWikiAnnotate", "Annotate" },
        b = {
          d = { "<Cmd>TaskWikiBurndownDaily", "Daily Burndown" },
          w = { "<Cmd>TaskWikiBurndownWeekly", "Weekly Burndown" },
          m = {"<Cmd>TaskWikiBurndownMonthly", "Monthly Burndown" },
        },
        c = {
          p = { "<Cmd>TaskWikiChooseProject", "Choose [P]roject"},
          t = { "<Cmd>TaskWikiChooseTag", "Choose [T]ag"},
        },

        C = { "<Cmd>TaskWikiCalendar", "Calendar" },
        d = { "<Cmd>TaskWikiDone", "Done" },
        D = { "<Cmd>TaskWikiDelete", "Delete" },
        e = { "<Cmd>TaskWikiEdit", "Edit" },
        g = { "<Cmd>TaskWikiGrid", "Grid" },
        G = {
          m = { "<Cmd>TaskWikiGhistoryMonthly", "Ghistory Monthly" },
          a = { "<Cmd>TaskWikiGhistoryAnnual", "Ghistory Annual" },
        },
        h = {
          m = { "<Cmd>TaskWikiHistoryMonthly", "History Monthly" },
          a = { "<Cmd>TaskWikiHistoryAnnual", "History Annual" },
        },
        i = { "<Cmd>TaskWikiInfo", "Info" },
        l = { "<Cmd>TaskWikiLink", "Link" },
        m = { "<Cmd>TaskWikiMod", "Mod" },
        p = { "<Cmd>TaskWikiProjects", "Projects" },
        s = { "<Cmd>TaskWikiProjectsSummary", "Projects Summary" },
        S = { "<Cmd>TaskWikiStats", "Stats" },
        t = { "<Cmd>TaskWikiTags", "Tags" },
        ['+'] = { "<Cmd>TaskWikiStart", "Start" },
        ['-'] = { "<Cmd>TaskWikiStop", "Stop" },
      }
    },
    -- v = {
    --   a = {},
    --   c = {
    --     p = {},
    --     t = {},
    --   },
    --   d = {},
    --   D = {},
    --   e = {},
    --   g = {},
    --   i = {},
    --   l = {},
    --   m = {},
    --   ['+'] = {},
    --   ['-'] = {},
    -- }
  })
}
