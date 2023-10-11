local wk = require('which-key')
return {
  wk.register{
    ['<localleader>'] = {
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
      }
    }
  }
}


-- Normal mode
--
-- Note: your terminal may prevent capturing some of the default bindings listed below. See :h vimwiki-local-mappings for suggestions for alternative bindings if you encounter a problem.
-- Basic key bindings
--
--     <Leader>ww -- Open default wiki index file.
--     <Leader>wt -- Open default wiki index file in a new tab.
--     <Leader>ws -- Select and open wiki index file.
--     <Leader>wd -- Delete wiki file you are in.
--     <Leader>wr -- Rename wiki file you are in.
--     <Enter> -- Follow/Create wiki link.
--     <Shift-Enter> -- Split and follow/create wiki link.
--     <Ctrl-Enter> -- Vertical split and follow/create wiki link.
--     <Backspace> -- Go back to parent(previous) wiki link.
--     <Tab> -- Find next wiki link.
--     <Shift-Tab> -- Find previous wiki link.
