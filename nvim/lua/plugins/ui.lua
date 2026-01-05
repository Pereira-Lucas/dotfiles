return {
  {
    -- Vimade
    -- Fadeout non focused windows
    'tadaa/vimade',
    opts = {
      recipe = { 'default', { animate = false } },
      fadelevel = 0.4,
      blocklist = {
        block_filetypes = function(_win, cur)
          local filetypes = {
            'query', -- Treesitter
            'qf', -- Quickfix
          }
        end,
        treesitter_query = function(_win, cur)
          if vim.bo[cur.bufnr].filetype == 'query' then
            return true
          end
        end,
        popup_window = function()
          if vim.api.nvim_win_get_config(0).relative ~= '' then
            return true
          end
        end,
      },
    },
  },
  {
    -- Quicker
    -- Better quickfix list
    'stevearc/quicker.nvim',
    event = 'FileType qf',
    opts = {},
  },
  {
    -- Fidget
    -- Replace default Neovim notify system
    'j-hui/fidget.nvim',
    opts = {
      notification = { override_vim_notify = true },
    },
  },
  {
    -- Barbecue
    -- VS Code style Winbar (breadcrumbs)
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      {
        'SmiteshP/nvim-navic',
        opts = {
          lsp = {
            auto_attach = true,
            preference = { 'vue_ls', 'ts_ls' },
          },
        },
      },
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      theme = 'catppuccin',
      show_dirname = false,
    },
  },
}
