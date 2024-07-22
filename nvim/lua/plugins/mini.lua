return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_filename = function()
      return '%t %m %r'
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_fileinfo = function()
      local filetype = vim.bo.filetype
      local encoding = vim.bo.fileencoding
      local format = vim.bo.fileformat

      if filetype == '' or vim.bo.buftype ~= '' then
        return ''
      end

      local devicons = require 'nvim-web-devicons'
      local file_name, file_ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
      local icon = devicons.get_icon(file_name, file_ext, { default = true })
      if encoding == 'utf-8' then
        encoding = ''
      end

      if format == 'unix' then
        format = ''
      else
        format = '[' .. format .. ']'
      end

      return string.format('%s %s %s %s', icon, filetype, encoding, format)
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
