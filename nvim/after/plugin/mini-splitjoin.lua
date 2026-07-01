local miniSplitJoin = require('mini.splitjoin')

miniSplitJoin.setup({
    mappings = { toggle = '' },
})

vim.keymap.set({ 'n', 'x' }, '<leader>jj', function() miniSplitJoin.join() end, { desc = 'join arguments' })
vim.keymap.set({ 'n', 'x' }, '<leader>jk', function() miniSplitJoin.split() end, { desc = 'split arguments' })
