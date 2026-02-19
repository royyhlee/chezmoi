-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- vim.opt.wrap = true

vim.g.snacks_animate = false
vim.g.autoformat = false

vim.opt.foldcolumn = "1" -- '0' is not recommended
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 2
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Default border style for windows
vim.opt.winborder = "single"

-- Enable borders for split windows
vim.opt.fillchars:append({ vert = "│", horiz = "─", vertleft = "┤", vertright = "├", verthoriz = "┼" })

vim.opt.relativenumber = false

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = "rounded" -- Or any other border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
--
-- vim.lsp.util.open_floating_preview = orig_util_open_floating_preview

-- vim.lsp.buf.hover() and any other windows like this one should have the border that you choosed above
