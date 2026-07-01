local opts = { noremap = true, silent = true }

require('gitsigns').setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '' },
    topdelete    = { text = '' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '' },
    topdelete    = { text = '' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
})

vim.keymap.set('n', '<leader>gb', '<CMD>:Gitsigns toggle_current_line_blame<CR>', opts)
