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

vim.api.nvim_create_autocmd('CursorMoved', {
  group = netrw_group,
  desc = 'Block the cursor to reach in the headers',
  callback = function()
    if vim.bo.filetype == 'netrw' then
      local row = vim.api.nvim_win_get_cursor(0)[1]
      local first_file_line
      for i = 0, vim.api.nvim_buf_line_count(0) - 1 do
        if not vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1]:match('^"') then
          first_file_line = i + 1
          break
        end
      end
      if first_file_line and row < first_file_line then
        vim.api.nvim_win_set_cursor(0, { first_file_line, 0 })
      end
    end
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
