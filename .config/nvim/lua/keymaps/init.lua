local keymap = vim.api.nvim_set_keymap
-- Ctrl-s to save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Ctrl-hjkl to navigate splits
local noMap = {noremap = true}
keymap('n', '<c-h>', ':<c-w>h', {})
keymap('n', '<c-j>', ':<c-w>j', {})
keymap('n', '<c-k>', ':<c-w>k', {})
keymap('n', '<c-l>', ':<c-w>l', {})

keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
keymap("n", "<leader>tm", ":tabNext<CR>", { noremap = true })
-- move current tab to previous position
keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

keymap("n", "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", {noremap = true})

keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true })
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true })
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { noremap = true })
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { noremap = true })
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true })
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true })
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true })
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true })
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true })
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true })
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })
keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true })
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true })

keymap('n', '<F5>', ':lua require"dap".continue()<CR>' , {noremap = true } )
keymap('n', '<F6>', ':lua require"dap".step_over()<CR>', {noremap = true } )
keymap('n', '<F7>', ':lua require"dap".step_into()<CR>', {noremap = true } )
keymap('n', '<F8>', ':lua require"dap".step_out()<CR>' , {noremap = true } )



keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', {noremap = true})
keymap('n', '<leader>dte', ':DapVirtualTextEnable<CR>', {noremap = true})
keymap('n', '<leader>dtt', ':DapVirtualTextToggle<CR>', {noremap = true})

keymap('n', '<leader>do', 'lua require"dapui".open()<CR>', {noremap = true})
keymap('n', '<leader>dc', 'lua require"dapui".close()<CR>', {noremap = true})
keymap('n', '<leader>dd', 'lua require"dapui".toggle()<CR>', {noremap = true})

vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Fira Code Retina"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function ()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-BS>", function() ResetGuiFont() end, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


vim.cmd("source ~/.config/nvim/lua/keymaps/keymaps.vim")
