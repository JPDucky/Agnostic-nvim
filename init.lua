vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.netrw_keepdir = 0

vim.opt.scrolloff = 14

vim.opt.wrap = false

-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_winsize = 25
--
-- vim.cmd [[
--   augroup ProjectDrawer
--     autocmd!
--     autocmd VimEnter * :Vexplore
--   augroup END
-- ]]


-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
 require("lazy").setup({
   -- NOTE: First, some plugins that don"t require any configuration

   -- Git related plugins
   "tpope/vim-fugitive",
   -- "if fugitive is the git, rhubarb is the hub" - tpope
   "tpope/vim-rhubarb",

   -- Detect tabstop and shiftwidth automatically
   "tpope/vim-sleuth",

   "folke/which-key.nvim",

   -- git signs
   {
     "lewis6991/gitsigns.nvim",
     opts = {
       signs = {
         add = { text = "+" },
         change = { text = "~" },
         delete = { text = "_" },
         topdelete = { text = "‾" },
         changedelete = { text = "~" },
       },
       on_attach = function(bufnr)
         vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })

         -- don"t override the built-in and fugitive keymaps
         local gs = package.loaded.gitsigns
         vim.keymap.set({ "n", "v" }, "]c", function()
           if vim.wo.diff then
             return "]c"
           end
           vim.schedule(function()
             gs.next_hunk()
           end)
           return "<Ignore>"
         end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
         vim.keymap.set({ "n", "v" }, "[c", function()
           if vim.wo.diff then
             return "[c"
           end
           vim.schedule(function()
             gs.prev_hunk()
           end)
           return "<Ignore>"
         end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
       end,
     },
   },


   -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
   --       These are some example plugins that I"ve included in the kickstart repository.
   --       Uncomment any of the lines below to enable them.
   -- require "kickstart.plugins.autoformat",
   -- require "kickstart.plugins.debug",

   -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
   --    You can use this folder to prevent any conflicts with this init.lua if you"re interested in keeping
   --    up-to-date with whatever is in the kickstart repo.
   --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
   --
   --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
   { import = "plugins" },
   { import = "plugins.utils" },
   { import = "plugins.behavior" },
   { import = "plugins.interface" },
   { import = "plugins.lsp" },
   -- { import = "plugins.lsp.langs" },
   { import = "plugins.themes" },
   { import = "plugins.debug" },
   --NOTE: Plugins in the /after directory will be loaded "after" the ones in the /plugin directory
   { import = "after.plugins" },

 }, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help "clipboard"`
vim.o.clipboard = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? "gk" : "k"", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? "gj" : "j"", { expr = true, silent = true })

-- [[ Autocommands ]]

--local autocmds = require 'after.plugins.functions.autocmds'
--vim.notify = require 'notify'
--
---- [[ Highlight on yank ]]
---- See `:help vim.highlight.on_yank()`
--local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
--vim.api.nvim_create_autocmd('TextYankPost', {
--  callback = function()
--    vim.highlight.on_yank()
--  end,
--  group = highlight_group,
--  pattern = '*',
--})
--
---- local help_portal = vim.api.nvim_create_augroup("HelpPortal", { clear = true })
---- vim.api.nvim_create_autocmd("BufWinEnter", {
----   callback = function()
----     vim.g.splitbelow = true
----   end,
----   group = help_portal,
----   pattern = "*help*",
---- })
----
---- vim.api.nvim_create_autocmd("BufWinLeave", {
----   callback = function()
----     vim.g.splitbelow = false
----   end,
----   group = help_portal,
----   pattern = "*help*",
---- })
----
--
---- local whichkey_ft = vim.api.nvim_create_augroup("WhichKeyFT", { clear = true })
---- vim.api.nvim_create_autocmd("FileType", {
----   callback = function()
----     vim.schedule(autocmds.WhichKeyFT)
----   end,
----   pattern = "*",
----   group = whichkey_ft,
---- })
--
--local function vimwiki_create()
--  local cwd = vim.loop.cwd()
--  local git_dir = vim.fn.finddir('.git', cwd)
--  if git_dir ~= '' then
--    local wiki_path = cwd .. '/wiki.md'
--
--    if vim.fn.filereadable(wiki_path) == 0 then
--      local file = io.open(wiki_path, 'w')
--      if file then
--        file:write '# Project TaskWiki\n'
--        file:close()
--        vim.notify('Project Wiki Created', 'info')
--      else
--        vim.notify('Failed to create wiki', 'info')
--      end
--    end
--  end
--end
--
--local wiki_create = vim.api.nvim_create_augroup('WikiCreate', { clear = true })
--vim.api.nvim_create_autocmd('VimEnter', {
--  callback = function()
--    vimwiki_create()
--  end,
--  group = wiki_create,
--})
--
--local help_split_group = vim.api.nvim_create_augroup('HelpSplit', { clear = true })
--
--vim.api.nvim_create_autocmd('BufEnter', {
--  callback = function()
--    local bt = vim.bo.buftype
--    if bt == 'help' then
--      vim.api.nvim_command 'wincmd L'
--    end
--  end,
--  group = help_split_group,
--  pattern = '*',
--})


vim.api.nvim_create_autocmd("InsertLeavePre", {
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local pos = vim.api.nvim_win_get_cursor(0)

    -- Store the cursor position if the line consists of only whitespace
    if line:match("^%s*$") then
      vim.g.saved_cursor_pos = pos
    end
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if vim.g.saved_cursor_pos then
      vim.api.nvim_win_set_cursor(0, vim.g.saved_cursor_pos)
      vim.g.saved_cursor_pos = nil
    end
  end
})
