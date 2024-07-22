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
      dap = false, -- Les couleurs sont définis manuellement dans la configuration du DAP
    },
    highlight_overrides = {
      all = function(colors)
        return {
          DapBreakpoint = { fg = colors.red },
          DapLogPoint = { fg = colors.subtext1 },
          DapStopped = { fg = colors.green },
        }
      end,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
  end,
  init = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
