local ok, config = pcall(require, 'config-local')

if not ok then
  print("Welp you must be windering how I got here")
  return
end

config.setup {
  config_files = {'.local.lua'}
}
