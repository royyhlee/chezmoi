return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  config = function()
    -- local palette = require("silkcircuit.palette")
    -- local colors = palette.get_colors()
    --
    -- require("codediff").setup({
    --   highlights = {
    --     -- Use theme's diff colors for consistency
    --     line_insert = colors.diff_add,
    --     line_delete = colors.diff_delete,
    --     char_insert = colors.git_add,
    --     char_delete = colors.git_delete,
    --   },
    -- })
  end,
}
