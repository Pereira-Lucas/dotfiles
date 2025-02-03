return {
  {
    'nvzone/typr',
    enabled = true,
    cmd = { 'Typr', 'TyprStats' },
    dependencies = {
      'nvzone/volt',
    },
    opts = {
      wpm_goal = 80,
      kblayout = 'azerty',
      stats_filepath = vim.fn.stdpath 'data' .. '/typrstats',
    },
  },
}
