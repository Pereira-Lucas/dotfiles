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

local netrw_group = vim.api.nvim_create_augroup('netrw', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  group = netrw_group,
  desc = 'Block the cursor to reach in the headers',
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

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  group = netrw_group,
  desc = 'Close the preview when entering a file',
  callback = function()
    if vim.bo.filetype ~= 'netrw' and not vim.wo.previewwindow then
      vim.cmd 'pclose'
    end
  end,
})

vim.api.nvim_create_user_command('Format', function(args)
  require('conform').format { bufnr = args.buf }
end, {})
