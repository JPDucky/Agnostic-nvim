-- Haven't gotten around to automatic install of linters so you'll have to
-- fill them in yourself for now:
return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        lua = { 'selene', 'luacheck' },
        python = { 'flake8' },
        ansible = { 'ansible_lint' },
        javascript = { 'biomejs', 'eslint' },
        cpp = { "cpplint" },
        [".env"] = { 'dotenv_linter' },
        html = { 'tidy' },
        json = { 'jsonlint' },
        nix = { 'nix' },
        php = { 'php' },

      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  }
}
