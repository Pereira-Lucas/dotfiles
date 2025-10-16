return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    {
      'SmiteshP/nvim-navic',
      opts = {
        lsp = {
          auto_attach = true,
          preference = { 'vue_ls', 'ts_ls' },
        },
      },
    },
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    theme = 'catppuccin',
    show_dirname = false,
  },
}
