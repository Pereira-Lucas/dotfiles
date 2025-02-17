return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {},
    -- keys = {
    --   { '<leader>gd', '<cmd>GitSigns diffthis<cr>', desc = '[G]it [D]iff' },
    -- },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitLog',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>go', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it [O]pen' },
      { '<leader>gg', '<cmd>LazyGitLog<cr>', desc = 'Lazy[G]it [G]raph' },
    },
  },
  {
    'TimothyGCY/blamer.nvim',
    opts = {},
    config = function()
      -- Toggle Git Blame for 5 seconds only
      vim.api.nvim_create_user_command('BlamerToggleShort', function()
        vim.cmd.BlamerShow()
        vim.defer_fn(vim.cmd.BlamerHide, 5000)
      end, {})
    end,
    keys = {
      { '<leader>gb', '<cmd>BlamerToggleShort<cr>', desc = '[G]it [B]lame' },
    },
  },
}
