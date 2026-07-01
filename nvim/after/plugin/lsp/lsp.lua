vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }

        -- Keymaps
        opts.desc = 'Show LSP references'
        vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

        opts.desc = 'Go to declaration'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = 'Show LSP definitions'
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

        opts.desc = 'Show LSP implementations'
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

        opts.desc = 'Show LSP type definitions'
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

        opts.desc = 'See available code actions'
        vim.keymap.set({ 'n', 'v' }, '<leader>vca', function()
            vim.lsp.buf.code_action()
        end, opts)

        opts.desc = 'Smart rename'
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        opts.desc = 'Show buffer diagnostics'
        vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

        opts.desc = 'Show line diagnostics'
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        opts.desc = 'Show documentation for what is under cursor'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', '<cmd>lsp restart<CR>', opts)

        vim.keymap.set('i', '<C-h>', function()
            vim.lsp.buf.signature_help()
        end, opts)
    end,
})

-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = ' ',
    [vim.diagnostic.severity.WARN] = ' ',
    [vim.diagnostic.severity.HINT] = '󰠠 ',
    [vim.diagnostic.severity.INFO] = ' ',
}

-- Set diagnostic config
vim.diagnostic.config({
    signs = {
        text = signs,
    },
    virtual_text = false,
    underline = false,
    update_in_insert = false,
})

vim.lsp.config('eslint', {
  settings = {
    workingDirectory = { mode = 'auto' },
  },
  filetypes = {
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
    'vue', 'svelte',
  },
})

vim.lsp.config('ts_ls', {
  settings = {
    typescript = {
      updateImportsOnFileMove = { enabled = 'always' },
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = 'always' },
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
      },
    },
  },
})

vim.lsp.inlay_hint.enable(false)
vim.keymap.set('n', '<leader>lh', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = 'Toggle inlay hints' })

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic',
      },
    },
  },
})

vim.lsp.enable({ 'eslint', 'basedpyright', 'ts_ls' })

-- Expand selection using LSP selectionRange (Neovim 0.12+)
vim.keymap.set({ 'n', 'x' }, '<leader>ee', function()
  vim.lsp.buf.selection_range(1)
end, { silent = true, desc = 'Expand selection (LSP selectionRange)' })

-- Optional: shrink selection
vim.keymap.set({ 'n', 'x' }, '<leader>ed', function()
  vim.lsp.buf.selection_range(-1)
end, { silent = true, desc = 'Shrink selection (LSP selectionRange)' })

-- toggle LSP diagnostics visibility --
local isLspDiagnosticsVisible = false
vim.keymap.set('n', '<leader>lx', function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = 'Toggle LSP diagnostics' })
