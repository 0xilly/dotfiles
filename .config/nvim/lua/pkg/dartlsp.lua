local ok, cfg = pcall(require, "flutter-tools")

if not ok then
  vim.notify("Error starting flutter-tools", vim.log.levels.ERROR)
  return
end

cfg.setup{}
