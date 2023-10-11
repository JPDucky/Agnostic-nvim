return {
  {
    'vimwiki/vimwiki',
    ft = 'markdown',
    lazy = false,
    init = function()
      vim.g.vimwiki_list = {{ ['path'] = '$HOME/vimwiki/', ['syntax'] = 'default', ['ext'] =  '.wiki' }}
      vim.g.vimwiki_key_mappings = {
        ['all_maps'] = 1,
        ['global'] = 1,
        ['headers'] = 1,
        ['text_objs'] = 1,
        ['table_format'] = 1,
        ['table_mappings'] = 1,
        ['lists'] = 1,
        ['links'] = 1,
        ['html'] = 1,
        ['mouse'] = 1,
      }
      vim.g.vimwiki_map_prefix = '<localleader>w'
    end
  },
}
