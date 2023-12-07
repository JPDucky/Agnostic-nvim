return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'jay-babu/mason-null-ls.nvim',
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim"
      },
      config = function()


        local null_ls = require('null-ls')
        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local hover = null_ls.builtins.hover
        local completion = null_ls.builtins.completion

        require('null-ls').setup({
          sources = {

            -- ansible
            diagnostics.ansiblelint,

            -- aws
            diagnostics.cfn_lint,

            -- bash/zsh/fish
            code_actions.shellcheck,
            diagnostics.shellcheck,
            diagnostics.zsh,
            formatting.beautysh,
            -- formatting.shellharden,
            -- formatting.shfmt,

            -- c/cpp/c#
            -- diagnostics.cppcheck,
            -- diagnostics.cpplint,
            -- formatting.astyle,
            -- formatting.uncrustify,

            -- docker
            diagnostics.hadolint,

            -- english
            code_actions.proselint,
            -- completion.spell,
            diagnostics.codespell,
            diagnostics.misspell,
            diagnostics.proselint,
            diagnostics.textlint,
            diagnostics.vale,
            diagnostics.write_good,

            -- .env files
            diagnostics.dotenv_linter,

            --git
            diagnostics.commitlint,
            code_actions.gitsigns,

            -- go
            -- code_actions.gomodifytags,
            -- code_actions.impl,
            -- diagnostics.golangci_lint,
            -- diagnostics.gospel,
            -- formatting.gofmt,
            -- formatting.goimports,
            -- formatting.golines,

            -- html/CSS
            diagnostics.curlylint,
            diagnostics.djlint,
            -- diagnostics.erb_lint,
            -- diagnostics.stylelint,
            -- diagnostics.stylint,
            -- diagnostics.tidy,
            -- formatting.djhtml,
            -- formatting.djlint,
            formatting.htmlbeautifier,
            formatting.stylelint,

            -- javascript/typescript
            code_actions.eslint,
            -- diagnostics.deno_lint,
            diagnostics.eslint,
            diagnostics.jshint,
            -- diagnostics.npm_groovy_lint,
            -- diagnostics.semistandardjs,
            -- diagnostics.standardjs,
            -- diagnostics.tsc,
            -- diagnostics.xo,
            -- formatting.biome,
            -- formatting.deno_fmt,
            -- formatting.docformatter,
            formatting.eslint,
            formatting.prettier,
            -- formatting.prismaFmt,
            -- formatting.semistandardjs,
            -- formatting.standardjs,
            -- formatting.standardts,

            -- json/yaml/toml
            diagnostics.jsonlint,
            -- diagnostics.spectral,
            -- diagnostics.yamllint,
            -- formatting.fixjson,
            -- formatting.json_tool,
            -- formatting.rustywind,
            -- formatting.taplo,
            -- formatting.xmlformat,
            -- formatting.xmllint,
            -- formatting.yamlfix,
            -- formatting.yamlfmt,

            -- latex
            diagnostics.chktex,

            -- lua
            completion.luasnip,
            -- diagnostics.luacheck,
            diagnostics.selene,
            -- formatting.lua_format,
            formatting.stylua,

            -- makefiles
            diagnostics.checkmake,
            diagnostics.cmake_lint,

            -- markup/markdown
            diagnostics.markdownlint,
            diagnostics.markuplint,
            -- diagnostics.mdl,
            -- formatting.cbfmt,
            formatting.markdownlint,
            formatting.markdown_toc,
            -- formatting.mdformat,
            -- formatting.remark,

            -- nix
            -- diagnostics.deadnix,
            -- diagnostics.statix,
            -- formatting.alejandra,
            -- formatting.nixfmt,
            -- formatting.nixpkgs_fmt,

            -- nginx
            formatting.nginx_beautifier,

            -- protocol buffers
            diagnostics.buf,
            diagnostics.protolint,
            formatting.buf,

            -- php
            -- diagnostics.php,
            -- formatting.blade_formatter,
            -- formatting.pint,

            -- puppet
            -- diagnostics.puppet_lint,
            -- formatting.puppet_lint,

            -- python
            -- diagnostics.bandit, -- must be installed with `pip install bandit`
            -- diagnostics.flake8,
            -- diagnostics.mypy,
            -- diagnostics.pycodestyle,
            -- diagnostics.pydocstyle,
            -- diagnostics.pylama,
            -- diagnostics.pylint,
            -- diagnostics.ruff,
            -- diagnostics.semgrep,
            -- diagnostics.vulture, -- must be installed with `pip install vulture`
            -- formatting.autoflake,
            -- formatting.autopep8,
            -- formatting.black,
            -- formatting.blue,
            -- formatting.isort,
            -- formatting.pyflyby,
            -- formatting.pyink,
            -- formatting.ruff,
            -- formatting.ruff_format,
            -- formatting.yapf,

            -- rust
            formatting.rustfmt,

            -- sql
            diagnostics.sqlfluff,
            formatting.sqlfluff,
            formatting.sqlfmt,
            formatting.sql_formatter,

            -- terraform
            -- formatting.terrafmt,
            -- formatting.terraform_fmt,

            -- vimscript
            diagnostics.vint,

            -- language agnostic
            code_actions.ltrs,
            code_actions.refactoring,
            code_actions.ts_node_action,
            diagnostics.editorconfig_checker,
            diagnostics.ltrs,
            diagnostics.todo_comments,
            diagnostics.trail_space,
            diagnostics.typos,
            formatting.textlint,
            formatting.trim_newlines,
            formatting.trim_whitespace,
            hover.dictionary,
            hover.printenv,

          }
        })

        -- local root_dir = function(fname)
        --   return fname:match("my-project") and "my-project-root"
        -- end

        require('mason-null-ls').setup({
          ensure_installed = nil,
          automatic_installation = true,
          automatic_setup = true,
          -- handlers = {},
        })
      end,
    },
  },
}
