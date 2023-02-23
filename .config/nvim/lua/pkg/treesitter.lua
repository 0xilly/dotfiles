local ok, cfg = pcall(require, 'nvim-treesitter.configs')

if not ok then
  vim.notify("Error starting treesitter", vim.log.levels.ERROR)
  return
end

cfg.setup {
  ensure_installed = { "c", "lua", "vim", "help", "java", "cpp" },

  auto_install = true,

  highlight = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}


