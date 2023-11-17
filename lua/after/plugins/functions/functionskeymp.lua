local mappings = require('lua.after.plugins.functions.keymapprint')

return {
  vim.api.nvim_create_user_command('GetMapping', function(args)
    local mode, keys = unpack(vim.split(args, " "))
    mappings.get__mapping(mode, keys)
  end, {nargs='*'})
}
