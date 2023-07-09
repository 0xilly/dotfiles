local ok, cfg = pcall(require, 'tree-sitter-just')

if not ok then
  vim.notify("Error starting just ts", vim.log.levels.ERROR)
  return
end
cfg.setup{}
