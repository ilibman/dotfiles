local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'H', '0', opts)
vim.keymap.set('n', 'L', '$', opts)
vim.keymap.set('n', 'A', '$a', opts)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'moves down in buffer with cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'moves up in buffer with cursor centered' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'keep search matches in the center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'keep search matches in the center' })

vim.keymap.set('v', '<', '<gv', opts)   -- indent lines with </>
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'replace the word under the cursor globally' })

vim.keymap.set('n', '<leader>ch', ':nohl<CR>', { desc = 'clear search hl', silent = true })

-- clipboard --
vim.keymap.set('n', 'x', '"_x', opts)   -- prevents chars deleted with x from copying to clipboard

-- tabs --
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', opts)   -- close tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', opts)   -- go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', opts)   -- go to prev tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', opts)   -- open current file in a new tab

vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'switch to the split to the right' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'switch to the split to the left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'switch to the split to the bottom' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'switch to the split to the top' })

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- copy filepath to the clipboard --
vim.keymap.set('n', '<leader>yf', function()
    local filePath = vim.fn.expand('%:~')   -- get the filepath relative to the home dir
    vim.fn.setreg('+', filePath)    -- copy filepath to the clipboard
    print('file path copied to clipboard: ' .. filePath)
end)

-- print stuff into the current buffer --
-- print the result of a command execution (for ex. 5mess to print the last 5 errors) --
vim.keymap.set('n', '<leader>px', function()
  local cmd = vim.fn.input(':', '', 'command')
  if cmd == '' then
    return
  end

  local output = vim.fn.execute(cmd)
  output = vim.fn.trim(output)

  vim.api.nvim_put({ output }, 'l', true, true)
end, opts)

-- print the last error into the buffer --
vim.keymap.set('n', '<leader>pl', function()
    vim.api.nvim_put({ vim.fn.trim(vim.fn.execute('1mess')) }, 'l', true, true)
end, opts)
