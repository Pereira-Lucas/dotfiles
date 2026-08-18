vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false
vim.o.clipboard = 'unnamedplus'

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.o.listchars = 'tab:» ,trail:·,nbsp:␣'
vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 15

vim.o.hlsearch = true

-- Providers
vim.g.loaded_python_provider = 0
if vim.fn.executable 'python3' == 1 then
  vim.g.python3_host_prog = vim.fn.exepath 'python3'
else
  vim.g.loaded_python3_provider = 0
end

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Netrw
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0
vim.g.netrw_winsize = 40

if vim.fn.has 'win32' == 1 then
  vim.o.shelltemp = false
  local shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  shellcmdflag = shellcmdflag .. '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();'
  shellcmdflag = shellcmdflag .. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
  vim.o.shellpipe = '> %s 2>&1; exit $LastExitCode'
  vim.o.shellredir = '>%s 2>&1; exit $LastExitCode'
  vim.o.shellquote = ''
  vim.o.shellxquote = ''

  if vim.fn.executable 'pwsh.exe' == 1 then
    vim.o.shell = 'pwsh.exe'
    shellcmdflag = shellcmdflag .. "$PSStyle.OutputRendering = 'PlainText';"
    vim.env.__SuppressAnsiEscapeSequences = '1'
  else
    vim.o.shell = 'powershell.exe'
  end
  vim.o.shellcmdflag = shellcmdflag
end
