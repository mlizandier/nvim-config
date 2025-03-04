return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",  -- S'assure que tous les parsers sont installés
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = "all",  -- Installe tous les parsers Tree-sitter
      highlight = {
        enable = true,  -- Active la coloration syntaxique avec Tree-sitter
      },
      indent = {
        enable = true,  -- Active l'indentation Tree-sitter
      },
    }
  end,
}
