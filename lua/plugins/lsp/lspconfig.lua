-- local langs = require('plugins.lsp.langs.lualang')
-- local lualang = langs.lualang()

return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim'},
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
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

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      --
      --  If you want to override the default filetypes that your language server will attach to you can
      --  define the property 'filetypes' to the map in question.

      local servers = {
        -- pylsp = {
        --   configurationSources = { "pycodestyle" }, -- "flake8"
        --   plugins = {
        --     autopep8 = {
        --       enabled = true, -- disable to use 'yapf'
        --     },
        --     flake8 = {
        --       enabled = false,
        --       -- config = "", -- path to config file that will be authoritative config source
        --       -- exclude = {""}, -- list of files or dirs to exclude
        --       -- executable = "", -- path to flake8 executable
        --       -- filename = "", -- only check for filenames mathing the patterns in this list
        --       -- hangClosing = true, -- hang closing bracket instead of matching indentation of opening bracket's line
        --       -- ignore = {}, -- list of errors and warnings to skip
        --       -- maxComplexity = 10, -- max allowed complexity threshold
        --       -- maxLineLength = 80, -- max allowed line length
        --       -- indentSize = 4, -- set indentation spaces
        --       -- perFileIgnores = {""}, --a pairing of filenames and violation codes to ignore, eg: "file_path.py:W305,W304"
        --       -- select = {""}, -- list of errors and warnings to enable
        --     },
        --     jedi = {
        --       -- auto_import_modules = { "numpy" }, -- list of module names to auto import
        --       -- extra_paths = {""}, -- define extra paths for jedi.Script
        --       -- env_vars = {}, -- define env vars for jedi.Script and Jedi.names
        --       -- environment = "", -- define environment for jedi.Script and Jedi.names
        --     },
        --     jedi_completion = {
        --       enabled = true,
        --       include_params = true, -- auto-completes methods and classes with tabstops for each parameter
        --       include_class_objects = true, -- adds class objects as a separate completion item
        --       include_function_objects = true, -- adds function objects as a separate completion item
        --       fuzzy = true, -- enable fuzzy when requesting autocomplete
        --       eager = true, -- resolve documentation and detail eagerly
        --       resolve_at_most = 25, -- how many labels and snippets (at most) should be resolved
        --       cache_for = {""}, -- modules for which labels and snippets should be cached
        --     },
        --     jedi_definition = {
        --       enabled = true,
        --       follow_imports = true, -- the goto call will follow imports
        --       follow_builtin_imports = true, -- if above is true will also follow builtin imports (requires above = true)
        --       follow_builtin_defintions = true, -- follow builtin and extension definitions to stubs
        --     },
        --     jedi_hover = {
        --       enabled = true,
        --     },
        --     jedi_references = {
        --       enabled = true,
        --     },
        --     jedi_signature_help = {
        --       enabled = true,
        --     },
        --     jedi_symbols = {
        --       enabled = true,
        --       all_scopes = true, -- if true lists names of all scopes instead of only the module namespace
        --       include_import_symbols = true, -- if true includes symbols imported from other libraries
        --     },
        --     mccabe = {
        --       enabled = true,
        --       threshold = 15, -- minimum threshold that triggers warning about cyclomatic complexity
        --     },
        --     preload = {
        --       enabled = true,
        --       -- modules = {""}, -- list of modules to import on startup
        --     },
        --     pycodestyle = {
        --       enabled = true,
        --       -- exclude = {""}, -- exclude files or dirs which match these patterns
        --       -- filename = {""}, -- when parsing dirs, only check filenames matching these patterns
        --       -- select = {""}, -- select errors and warnings
        --       -- ignore = {""}, -- ignore errors and warnings
        --       -- hangClosing = true, -- hang closing bracket instead of matching indentation of opening bracket's line
        --       -- maxLineLength = 80,
        --       -- indentSize = 4,
        --     },
        --     pydocstyle = {
        --       enabled = true,
        --       convention = "pep257", -- "numpy" | "google" | "None"
        --       -- addIgnore = {""},
        --       -- addSelect = {""},
        --       -- ignore = {""},
        --       -- select = {""},
        --       match = "(?!test_).*\\.py",
        --       matchDir = "[^\\.].*",
        --     },
        --     pyflakes = {
        --       enabled = true,
        --     },
        --     pylint = {
        --       enabled = true,
        --       -- args = {},
        --       -- executable = ""
        --     },
        --     -- rope_autoimport = {
        --     --   enabled = false,
        --     --   memory = false,
        --     -- },
        --     -- rope_completion = {
        --     --   enabled = false,
        --     --   eager = false,
        --     -- },
        --     yapf = {
        --       enabled = false,
        --     },
        --     -- rope = {
        --     --   extensionsModule = "",
        --     --   ropeFolder = {""},
        --     -- },
        --   },
        -- },
    --     sourcery = {
    --       setup = {
    --         init_options = {
    --     --- The Sourcery token for authenticating the user.
    --     --- This is retrieved from the Sourcery website and must be
    --     --- provided by each user. The extension must provide a
    --     --- configuration option for the user to provide this value.
    --     token = <YOUR_TOKEN>,
    --
    --     --- The extension's name and version as defined by the extension.
    --     extension_version = 'vim.lsp',
    --
    --     --- The editor's name and version as defined by the editor.
    --     editor_version = 'vim',
    -- },
    --       }
    --     },
        gopls = {},
        rust_analyzer = {},
        html = { filetypes = { 'html', 'twig', 'hbs'} },
        -- angularls = {},
        -- astro = {},
        -- biome = {},
        -- cssmodules_ls = {},
        -- custom_elements_ls = {},
        -- emmet_ls = {},
        -- eslint = {},
        -- graphql = {},
        -- prismals = {},
        -- svelte = {},
        -- tailwindcss = {},
        -- tsserver = {},
        -- volar = {},
        -- vtsls = {},
        -- vuels = {},

        -- luacheck = {},
        -- luaformatter = {}, 
        -- efm = efmls_config,
        -- lua = { lualang }
      }

      local langs = {}

      -- imported language files
      langs.lua_config = require('plugins.lsp.langs.lua')
      langs.python = require('plugins.lsp.langs.python')

      -- loop through imported configs to put them in server table
      for server, _, config in pairs(langs) do
        servers[server] = config
      end

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

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
    end

  },
}
