local MiniFiles = require('mini.files')
MiniFiles.setup({
    mappings = {
        go_in = '<CR>',
        go_in_plus = 'L',
        go_out = '-',
        go_out_plus = 'H'
    },
    windows = {
        preview = true
    }
})

vim.keymap.set('n', '<leader>me', '<CMD>lua MiniFiles.open()<CR><BS>', { desc = 'toggle mini files'})
vim.keymap.set('n', '<leader>mf', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = 'toggle into currently loaded file' })
