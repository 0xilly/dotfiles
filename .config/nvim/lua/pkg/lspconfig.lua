local ok, cfg = pcall(require, 'lspconfg')

if not ok then
  vim.notify("Error starting lspconfig", vim.log.levels.ERROR)
  return
end

local servers = {'clangd', 'jdtls', 'sumneko_lua', 'rust)analyzer'}

for _, lsp in pairs(servers) do 
  cfg[lsp].setup{}
end
