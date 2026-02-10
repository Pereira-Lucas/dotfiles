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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_create_autocmd('CursorMoved', {
      buffer = 0,
      callback = function()
        local row = vim.api.nvim_win_get_cursor(0)[1]
        if row < 8 then
          vim.api.nvim_win_set_cursor(0, { 8, 0 })
        end
      end,
    })
  end,
})

vim.api.nvim_create_user_command('Format', function(args)
  require('conform').format { bufnr = args.buf }
end, {})
