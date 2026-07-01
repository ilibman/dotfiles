local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_installer = require('mason-tool-installer')

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lspconfig.setup({
    ensure_installed = {
        'eslint',
        'ts_ls',
        'basedpyright',
    },
    automatic_enable = true
})

mason_tool_installer.setup({
    ensure_installed = {
        'eslint',
        'ts_ls',
        'basedpyright',
        'jinja-lsp',
        'html-lsp',
        'json-lsp',
        'css-lsp',
        'bash-language-server'
    }
})
