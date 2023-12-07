return {
  {
      {
        'williamboman/mason.nvim',
        config = function()
          require("mason").setup()
        end,
      },

      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('mason-lspconfig').setup()
        end,
      },
      {
        "folke/neodev.nvim",
        opts = {},
      },
  },

  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim",               cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim" },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim',                tag = 'legacy',  opts = {} },
      {
        'creativenull/efmls-configs-nvim',
        version = 'v1.1.1',
        dependencies = { 'neovim/nvim-lspconfig' },
      }
    },

    -- [[ Configure LSP ]]
    config = function()
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end


        -- local eslint = require('efmls-configs.linters.eslint')
        -- local prettier = require('efmls-configs.formatters.prettier')
        -- local stylua = require("efmls-configs.formatters.stylua")
        --
        -- local languages = {
        --   typescript = { eslint, prettier },
        --   lua = { stylua },
        -- }
        --
        -- local efmls_config = {
        --   filetypes = vim.tbl_keys(languages),
        --   settings = {
        --     rootMarkers = { '.git/' },
        --     languages = languages,
        --   },
        --   init_options = {
        --     documentFormatting = true,
        --     documentRangeFormatting = true,
        --   },
        -- }


        --TODO: move these to keymaps file
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end
      -- end on_attach autocmd

      local servers = {}
      local langs = {}

      -- Setup neovim lua configuration
      require('neodev').setup({})
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })

      local config_dir = vim.fn.stdpath('config')

      local plugins_dir = vim.fs.joinpath(config_dir, 'lua', 'plugins')

      local langs_dir = vim.fs.joinpath(plugins_dir, 'lsp', 'langs')

      local dir_handle = vim.loop.fs_scandir(langs_dir)

      -- ensure that the files within ./langs are named with the filetype
      if dir_handle then
        while true do
          local file, type = vim.loop.fs_scandir_next(dir_handle)
          if not file then break end
          local file = vim.fn.fnamemodify(file, ':t')
          if file:match('%.lua$') then
            local name = file:gsub('%.lua$', '')
            local module_path = 'plugins.lsp.langs.' .. name
            local config = require(module_path)
            langs[name] = config
          end
        end
      end

      -- loop through imported configs to put them in server table
      for _, config in pairs(langs) do
        for server, config in pairs(config) do
          servers[server] = config
        end
      end

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup({
        ensure_installed = {}
      })

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end
      }

      local ts_config = require("nvim-treesitter.configs")

      ts_config.setup {
        ensure_installed = vim.tbl_keys(langs)
      }

      vim.diagnostic.config({
        virtual_text = true,
        signs = { active = signs },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        }
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end
  },
}
