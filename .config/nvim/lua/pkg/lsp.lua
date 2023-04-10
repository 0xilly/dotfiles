local ok, mason = pcall(require, "mason")
local ok_mlsp, mason_lsp = pcall(require, "mason-lspconfig")



if not mason_ok or not mason_lsp_ok then
  return
end

local servers = {"lua_ls", "clangd", "jdtls", "gopls", "rust_analyzer"}

mason.setup {
}

mason_lsp.setup {
  ensure_install = servers,
  automatic_installation = true,
}

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in pairs(servers) do
  lspconfig[server].setup{
    capabilities = capabilities
  }
end

require('mason-lspconfig').setup_handlers({
  function(server)
    for _, lsp in pairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities
      })
    end
  end,
})
