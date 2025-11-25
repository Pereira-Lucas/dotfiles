return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    opts = {
      -- NOTE: There is no more config to set since TS:main
      -- Theses are all customs
      --
      ensure_installed = { 'bash', 'html', 'css', 'lua', 'markdown', 'vim', 'vimdoc', 'vue', 'javascript', 'jsdoc', 'sql' },
      highlight = {
        disable = function(buf)
          local max_filesize = 1024 * 1024 -- 1 MB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
          return false
        end,
      },
    },
    config = function(_, opts)
      local treesitter = require 'nvim-treesitter'

      treesitter.setup(opts)

      treesitter.install(opts.ensure_installed)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(event)
          local parser_found = vim.treesitter.get_parser(nil, nil, { error = false })
          local disabled = opts.highlight.disable(event.buf)

          if parser_found and not disabled then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 3,
    },
  },
}
