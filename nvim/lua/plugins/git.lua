return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>go', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it [O]pen' },
    },
  },
  {
    'APZelos/blamer.nvim',
    cmd = {
      'BlamerToggle',
    },
    config = function()
      -- Toggle Git Blame for 5 seconds only
      vim.api.nvim_create_user_command('BlamerToggleShort', function()
        vim.cmd.BlamerToggle()
        vim.defer_fn(vim.cmd.BlamerToggle, 5000)
      end, {})
    end,
    keys = {
      { '<leader>gb', '<cmd>BlamerToggleShort<cr>', desc = '[G]it [B]lame' },
    },
  },
}
