local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

vim.o.rtp = lazypath .. ',' .. vim.o.rtp

--@type LazySpecImport
require('lazy').setup {
  { 'nmac427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically
  {
    'nvim-lua/plenary.nvim',
    priority = 1000,
    config = function()
      if vim.g.is_win32 == 1 then
        local Path = require 'plenary.path'

        local original_tostring = Path.__tostring
        local original_absolute = Path.absolute
        local original_new = Path.new

        Path.new = function(...)
          local args = { ... }
          if #args == 0 then
            return original_new(unpack(args))
          end

          for i, path in ipairs(args) do
            if type(path) == 'string' then
              args[i] = string.gsub(path, '/', '\\')
            end
          end

          local result = original_new(unpack(args))
          return result
        end
      end
    end,
  },
  {
  },
  'MunifTanjim/nui.nvim',
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { import = 'plugins' },
}
