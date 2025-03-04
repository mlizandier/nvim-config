-- utilisation de prettierd
return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        markdown = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        ["*"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        prettierd = {
          condition = function()
            return vim.loop.fs_realpath("prettier.js") ~= nil
          end,
        },
      },
    })
  end,
}