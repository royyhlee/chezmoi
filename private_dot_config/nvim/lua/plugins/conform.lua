return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettierd" },
      htmlangular = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
    },
    formatters = {
      prettierd = {
        prepend_args = { "--single-attribute-per-line", "--bracket-same-line", "--arrow-parens=avoid" },
      },
    },
  },
}
