return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    require("noice").setup({
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
    })
  end,
}
