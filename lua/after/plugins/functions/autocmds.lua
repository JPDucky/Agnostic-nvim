local wk = require('which-key')

-- local wkGrp = vim.api.nvim_create_augroup("WhichKeyLoader", { clear = true })
-- vim.api.nvim_create_autocmd("WhichKeyTaskWiki", {
--   command = -- TODO: get wk table,
--   ---@stylua: ignore
--   group = wkGrp,
-- })

  function WhichKeyFT()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local fname = vim.fn.expand "%:p:t"
    local keymap_table = {}

    if ft == "vimwiki" then
      keymap_table = {
          w = {
            name = "+[W]iki",
            y = { "<Plug>VimwikiMakeYesterdayDiaryNote", "Create Yesterday's Note" },
            n = { "<Plug>VimwikiTabMakeDiaryNote", "Create Today's Note" },
            t = { "<Plug>VimwikiMakeTomorrowDiaryNote", "Create Tomorrow's Note" },
            w = { "<Plug>VimwikiMakeDiaryNote", "Create Diary Note" },
            i = { "<Plug>VimwikiDiaryGenerateLinks", "Generate Links" },
            d = { "<Plug>VimwikiDiaryIndex", "Vimwiki Index" },
            s = { "<Plug>VimwikiUISelect", "Vimwiki UI Select" },
            I = { "<Plug>VimwikiIndex", "Index" },
            T = { "<Plug>VimwikiTabIndex", "Tab Index" },
          },
          t = {
            name = "+[T]ask",
            a = { "Annotate" },
            b = {
              name = "+[B]urndowns",
              d = {  "Daily Burndown" },
              w = { "Weekly Burndown" },
              m = { "Monthly Burndown" },
            },
            c = {
              name = "+[C]hoose Project/Tag",
              p = { "Choose [P]roject"},
              t = { "Choose [T]ag"},
            },

            C = { "Calendar" },
            d = { "Done" },
            D = { "Delete" },
            e = { "Edit" },
            g = { "Grid" },
            G = {
              name = "+[G]History",
              m = {  "Ghistory Monthly" },
              a = {  "Ghistory Annual" },
            },
            h = {
              name = "+[H]istory",
              m = { "History Monthly" },
              a = { "History Annual" },
            },
            i = { "Info" },
            l = { "Link" },
            m = { "Mod" },
            p = { "Projects" },
            s = { "Projects Summary" },
            S = { "Stats" },
            t = { "Tags" },
            ['+'] = { "Start" },
            ['-'] = { "Stop" },
          }
      }
    end

    if fname == 'package.json' then
      keymap_table.v = { "<Cmd>lua require('package-info').show()<CR>", "Show Version" }
    end
    if next(keymap_table) ~= nil then
      wk.register(
      { keymap_table },
      { mode = "n", silent = true, noremap = true, prefix = "<localleader>" }
      )
    end
  end

return {
  WhichKeyFT = WhichKeyFT
}
