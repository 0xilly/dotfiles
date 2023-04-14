local ok_mason, mason = pcall(require, "mason")

local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")


if not ok_mason or not ok_mason_lsp then
  vim.notify("Error starting mason", vim.log.levels.ERROR)
  return
end

local lsp_list = {"lua_ls", "clangd", "rust_analyzer", "java-language-server"}

mason.setup{}
mason_lsp.setup{
  ensure_installed = lsp_list,
  automatic_installation = true,
}

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local noop = function() end

require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({
      on_attach = lsp_attach,
      capabilities = capabilities,
    })
  end,
  ['clangd'] = noop,

})
  -- So qucik rant because the author of this jdtls-nvim is a broken plugin and the plugin author refues to fix it
lspconfig['java-language-server'].setup{}
