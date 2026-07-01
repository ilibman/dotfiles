require('ts_context_commentstring').setup({
    enable_autocmd = false
})

require('mini.comment').setup({
    options = {
        custom_commentstring = function()
            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = 'commentstring'
            }) or vim.bo.commentstring
        end
    }
})
