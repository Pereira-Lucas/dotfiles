return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'AlexvZyl/nordic.nvim',
    name = 'nordic',
    priority = 1000,
  },
  {
    'zaldih/themery.nvim',
    name = 'themery',
    priority = 1100,
    config = function(_, opts)
      require('themery').setup {
        themes = {
          {
            name = 'Nordic',
            colorscheme = 'nordic',
            after = [[
              local colors = require 'nordic.colors'
              require('nordic').setup {
                bright_border = true,
                override = {
                  LineNr = { bg = colors.black1 },
                },
              }
            ]],
          },
          {
            name = 'Catppuccin',
            colorscheme = 'catppuccin-mocha',
            after = [[
              require('catppuccin').setup {
                integrations = {
                  mini = {
                    enabled = true,
                    indenscope_color = 'lavender',
                  },
                  dap = false, 
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

                      -- TODO: Récupérer les highlight de Telescope
                      -- TODO: Récupérer les highlight du DAP
                    }
                  end,
                },
              }
            ]],
          },
        },
      }
    end,
  },
}
