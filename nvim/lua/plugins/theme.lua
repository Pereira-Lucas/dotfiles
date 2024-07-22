return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    integrations = {
      mini = {
        enabled = true,
        indenscope_color = 'lavender',
      },
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
  end,
  init = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
