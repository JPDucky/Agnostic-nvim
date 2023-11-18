return {
  lua_ls = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = true,
      },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace",
      }
    },
  },
}
