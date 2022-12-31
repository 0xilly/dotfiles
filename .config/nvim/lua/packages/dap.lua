local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    environment = {},
    stopOnEntry = false,
    args = {},
    runInTerminal = false
  }
}
dap.configurations.c = dap.configurations.cpp
local root = vim.fn.finddir('.git/..', ';')
require('dap.ext.vscode').load_launchjs(root .. '/.vim/launch.json') -- parse .vim/launch.json if exists
require('dap.ext.vscode').load_launchjs(root .. '/.vscode/launch.json') -- parse .vim/launch.json if exists
