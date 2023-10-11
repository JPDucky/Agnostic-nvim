local wk = require("which-key")
return {
  wk.register({
    ['<A-i>'] = { "<Cmd>FloatermToggle<CR>", "Float-Term Toggle" },
  }, { mode = "t" })
}
