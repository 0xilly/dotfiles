--require'lspconfig'.clangd.setup{}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local servers = {'clangd', 'jdtls', 'gopls', 'sumneko_lua', 'rust_analyzer', 'zls'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup{}
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'clangd' }
--for _, lsp in pairs(servers) do
--  require('lspconfig')[lsp].setup {
--    on_attach = on_attach,
--    flags = {
--      -- This will be the default in neovim 0.7+
--      debounce_text_changes = 150,
--    }
--  }
--end

