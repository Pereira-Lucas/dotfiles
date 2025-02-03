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
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>go', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it [O]pen' },
    },
  },
  {
    'TimothyGCY/blamer.nvim',
    cmd = {
      'BlamerToggle',
    },
    opts = {},
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
  {
    'isakbm/gitgraph.nvim',
    opts = {
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        '<leader>gg',
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = '[G]it[G]raph - Draw',
      },
    },
  },
}
