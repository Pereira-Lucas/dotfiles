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

          -- Couleurs de fond de la marge
          LineNr = { bg = colors.mantle },
          CursorLineNr = { bg = colors.mantle },
          SignColumn = { bg = colors.mantle },
          GitSignsAdd = { bg = colors.mantle },
          GitSignsChange = { bg = colors.mantle },
          GitSignsDelete = { bg = colors.mantle },
          DiagnosticSignError = { bg = colors.mantle },
          DiagnosticSignO = { bg = colors.mantle },
          DiagnosticSignHint = { bg = colors.mantle },
          DiagnosticSignInfo = { bg = colors.mantle },
          DiagnosticSignWarn = { bg = colors.mantle },
          LspInlayHint = { bg = colors.mantle },
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
