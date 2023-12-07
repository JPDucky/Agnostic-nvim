return {
  pylsp = {
    configurationSources = { "pycodestyle" }, -- "flake8"
    plugins = {
      autopep8 = {
        enabled = true, -- disable to use 'yapf'
      },
      flake8 = {
        enabled = false,
        -- config = "", -- path to config file that will be authoritative config source
        -- exclude = {""}, -- list of files or dirs to exclude
        -- executable = "", -- path to flake8 executable
        -- filename = "", -- only check for filenames matching the patterns in this list
        -- hangClosing = true, -- hang closing bracket instead of matching indentation of opening bracket's line
        -- ignore = {}, -- list of errors and warnings to skip
        -- maxComplexity = 10, -- max allowed complexity threshold
        -- maxLineLength = 80, -- max allowed line length
        -- indentSize = 4, -- set indentation spaces
        -- perFileIgnores = {""}, --a pairing of filenames and violation codes to ignore, eg: "file_path.py:W305,W304"
        -- select = {""}, -- list of errors and warnings to enable
      },
      jedi = {
        -- auto_import_modules = { "numpy" }, -- list of module names to auto import
        -- extra_paths = {""}, -- define extra paths for jedi.Script
        -- env_vars = {}, -- define env vars for jedi.Script and Jedi.names
        -- environment = "", -- define environment for jedi.Script and Jedi.names
      },
      jedi_completion = {
        enabled = true,
        include_params = true, -- auto-completes methods and classes with tabstops for each parameter
        include_class_objects = true, -- adds class objects as a separate completion item
        include_function_objects = true, -- adds function objects as a separate completion item
        fuzzy = true, -- enable fuzzy when requesting autocomplete
        eager = true, -- resolve documentation and detail eagerly
        resolve_at_most = 25, -- how many labels and snippets (at most) should be resolved
        cache_for = {""}, -- modules for which labels and snippets should be cached
      },
      jedi_definition = {
        enabled = true,
        follow_imports = true, -- the goto call will follow imports
        follow_builtin_imports = true, -- if above is true will also follow builtin imports (requires above = true)
        follow_builtin_defintions = true, -- follow builtin and extension definitions to stubs
      },
      jedi_hover = {
        enabled = true,
      },
      jedi_references = {
        enabled = true,
      },
      jedi_signature_help = {
        enabled = true,
      },
      jedi_symbols = {
        enabled = true,
        all_scopes = true, -- if true lists names of all scopes instead of only the module namespace
        include_import_symbols = true, -- if true includes symbols imported from other libraries
      },
      mccabe = {
        enabled = true,
        threshold = 15, -- minimum threshold that triggers warning about cyclomatic complexity
      },
      preload = {
        enabled = true,
        -- modules = {""}, -- list of modules to import on startup
      },
      pycodestyle = {
        enabled = true,
        -- exclude = {""}, -- exclude files or dirs which match these patterns
        -- filename = {""}, -- when parsing dirs, only check filenames matching these patterns
        -- select = {""}, -- select errors and warnings
        -- ignore = {""}, -- ignore errors and warnings
        -- hangClosing = true, -- hang closing bracket instead of matching indentation of opening bracket's line
        -- maxLineLength = 80,
        -- indentSize = 4,
      },
      pydocstyle = {
        enabled = true,
        convention = "pep257", -- "numpy" | "google" | "None"
        -- addIgnore = {""},
        -- addSelect = {""},
        -- ignore = {""},
        -- select = {""},
        match = "(?!test_).*\\.py",
        matchDir = "[^\\.].*",
      },
      pyflakes = {
        enabled = true,
      },
      pylint = {
        enabled = true,
        -- args = {},
        -- executable = ""
      },
      -- rope_autoimport = {
      --   enabled = false,
      --   memory = false,
      -- },
      -- rope_completion = {
      --   enabled = false,
      --   eager = false,
      -- },
      yapf = {
        enabled = false,
      },
      -- rope = {
      --   extensionsModule = "",
      --   ropeFolder = {""},
      -- },
    },
  },
}
