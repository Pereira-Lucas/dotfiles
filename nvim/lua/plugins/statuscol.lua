return {
  'luukvbaal/statuscol.nvim',
  enable = false,
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    local builtin = require 'statuscol.builtin'

    require('statuscol').setup {
      relculright = true,
      ft_ignore = {
        'aerial',
        'avante',
        'avanteInput',
        'help',
        'neo-tree',
        'toggleterm',
      },
      segments = {
        {
          sign = {
            namespace = { 'gitsigns' },
            colwidth = 1,
            wrap = true,
          },
          click = 'v:lua.ScSa',
        },
        -- {
        --   sign = {
        --     namespace = { 'gitsigns' },
        --     colwidth = 1,
        --     auto = false,
        --   },
        --   click = 'v:lua.ScSa',
        -- },

        {
          sign = { namespace = { 'diagnostic.signs' }, maxwidth = 1, wrap = true },
          click = 'v:lua.ScSa',
        },
        {
          text = {
            '%=',
            function(args)
              local mode = vim.fn.mode()
              local normalized_mode = vim.fn.strtrans(mode):lower():gsub('%W', '')

              -- case 1
              if normalized_mode ~= 'v' and vim.v.virtnum == 0 then
                return builtin.lnumfunc(args)
              end

              if vim.v.virtnum < 0 then
                return '-'
              end

              local line = builtin.lnumfunc(args)

              if vim.v.virtnum > 0 then
                local num_wraps = vim.api.nvim_win_text_height(args.win, {
                  start_row = args.lnum - 1,
                  end_row = args.lnum - 1,
                })['all'] - 1

                if vim.v.virtnum == num_wraps then
                  line = '└'
                else
                  line = '├'
                end
              end
              local hl_str = function(hl, str)
                return '%#' .. hl .. '#' .. str .. '%*'
              end
              -- Highlight cases
              if normalized_mode == 'v' then
                local pos_list = vim.fn.getregionpos(vim.fn.getpos 'v', vim.fn.getpos '.', { type = mode, eol = true })
                local s_row, e_row = pos_list[1][1][2], pos_list[#pos_list][2][2]

                if vim.v.lnum >= s_row and vim.v.lnum <= e_row then
                  return hl_str('CursorLineNr', line)
                end
              end

              return vim.fn.line '.' == vim.v.lnum and hl_str('CursorLineNr', line) or hl_str('LineNr', line)
            end,
            ' ',
          },
          condition = {
            function()
              return vim.wo.number or vim.wo.relativenumber
            end,
          },
        },
        {
          sign = { name = { '.*' }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
          click = 'v:lua.ScSa',
        },
        {
          text = { builtin.foldfunc },
          condition = {
            function()
              return vim.api.nvim_get_option_value('modifiable', { buf = 0 }) or ' '
            end,
          },
        },
      },
    }
  end,
}
