return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {},
    keys = {
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>', desc = '[G]it [B]lame' },
      { '<leader>gl', '<cmd>Gitsigns setqflist<cr>', desc = '[G]it [L]ist changes' },
      { '<leader>gp', '<cmd>Gitsigns preview_hunk_inline<cr>', desc = '[G]it [P]review hunk' },
    },
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
}
