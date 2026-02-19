local lspconfig = require('lspconfig')

lspconfig.html.setup({
    filetypes = { 'html', 'cshtml' },
    cmd = { "vscode-html-languageserver", "--stdio" }
})
