local todo_comments = require('todo-comments')
todo_comments.setup({
    highlight = {
        pattern = {
            [[.*<(KEYWORDS)\s*:]], -- default pattern
            [[<!--\s*(KEYWORDS)\s*:.*-->]], -- HTML comments with colon
            [[<!--\s*(KEYWORDS)\s*.*-->]], -- HTML comments without colon
        },
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    }
})

vim.keymap.set('n', ']t', function()
    todo_comments.jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
    todo_comments.jump_prev()
end, { desc = 'Previous todo comment' })

vim.keymap.set('n', '<leader>fc', '<CMD>TodoTelescope<CR>', { desc = 'look up comments in telescope' })
