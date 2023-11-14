return {
  "roobert/activate.nvim",
  --  TODO: Move this to keybind file
  keys = {
    {
      "<leader>lpp",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = 'Plugins',
    },
  }
}
