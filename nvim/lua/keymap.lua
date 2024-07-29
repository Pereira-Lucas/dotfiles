vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 's', '<Nop>')

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Test en cours
vim.keymap.set('n', '<leader>sc', function()
  vim.ui.input({ prompt = 'Recherche : ' }, function(search)
    if search == nil or search == '' then
      return
    end

    search = search:gsub(' ', '+')

    local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })

    local Popup = require 'nui.popup'
    local event = require('nui.utils.autocmd').event

    local popup = Popup {
      enter = true,
      focusable = true,
      border = {
        style = 'rounded',
      },
      position = '50%',
      size = {
        width = '80%',
        height = '80%',
      },
    }

    -- mount/open the component
    popup:mount()

    -- unmount component when cursor leaves buffer
    popup:on(event.BufLeave, function()
      popup:unmount()
    end)

    -- unmount component when pressing q
    vim.api.nvim_buf_set_keymap(popup.bufnr, 'n', 'q', '<cmd>q<cr>', { noremap = true, silent = true })

    vim.fn.jobstart({ 'curl', 'cht.sh/' .. filetype .. '/' .. search .. '?T' }, {
      on_stdout = function(err, data)
        if data then
          vim.api.nvim_buf_set_lines(popup.bufnr, -1, -1, false, data)
        end
      end,
      on_exit = function()
        vim.api.nvim_set_option_value('filetype', filetype, { buf = popup.bufnr })
        vim.api.nvim_set_option_value('modifiable', false, { buf = popup.bufnr })
        vim.api.nvim_set_option_value('readonly', true, { buf = popup.bufnr })
      end,
    })
  end)
end)
