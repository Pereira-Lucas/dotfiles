-- Env files
vim.filetype.add {
  extension = {
    env = 'sh',
  },
  filename = {
    ['.env'] = 'sh',
  },
  pattern = {
    ['%.env%.[%w_.-]+'] = 'sh',
  },
}

-- Sequelize files

vim.filetype.add {
  extension = {
    sequelizerc = 'javascript',
  },
  filename = {
    ['.sequelizerc'] = 'javascript',
  },
}
