require 'options'
require 'filetypes'
require 'keymap'
require 'lazy_init'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Launch a typing test when opening Vim',
  callback = function()
    -- vim.cmd 'Typr'
  end,
})

vim.api.nvim_create_user_command('Format', function(args)
  require('conform').format { bufnr = args.buf }
end, {})

-- TODO: voir ce truc
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
