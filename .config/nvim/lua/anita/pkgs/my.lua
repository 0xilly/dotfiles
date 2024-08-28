return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "my" }, -- Add your language here
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.my = {
        install_info = {
          url = "~/Devel/nvimshit/my-treesitter", -- local path to your parser
          files = {"src/parser.c"},
          generate_requires_npm = true, -- Install nodejs/npm if not already installed
          requires_generate_from_grammar = true, -- If folder contains pre-generated src/parser.c
        },
        filetype = "my", -- if filetype does not match the parser name
      }
    end,
  },
  {
    dir = "~/Devel/nvimshit/my-treesitter",
    build = function()
      vim.fn.system("npx tree-sitter generate && npx tree-sitter build")
    end,
  },
}
