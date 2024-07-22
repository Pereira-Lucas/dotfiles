return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    ft = 'norg',
    cmd = 'Neorg',
    priority = 30,
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.qol.todo_items'] = {},
          ['core.itero'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = 'D:/Documents/Neorg',
              },
            },
          },
        },
      }
    end,
  },
}
