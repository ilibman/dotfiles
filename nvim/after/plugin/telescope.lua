local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
            },
        },
    }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  callback = function(args)
    local ok, state = pcall(require, 'telescope.actions.state')
    if not ok then return end

    local picker = state.get_current_picker(args.buf)
    if not picker then return end

    if picker.prompt_title == 'Find Files' or picker.prompt_title == 'Buffers' then
      -- Disable all Vim completion
      vim.bo[args.buf].complete = ''
      vim.bo[args.buf].omnifunc = ''
      vim.bo[args.buf].completefunc = ''
      vim.bo[args.buf].keywordprg = ''

      -- Optional: also suppress popup menu behavior
      vim.bo[args.buf].completeopt = 'menuone,noselect'
    end
  end,
})

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
    -- path_display = { 'truncate' }
  })
end, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.live_grep({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fg', function()
  builtin.git_files({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fr', function()
  builtin.oldfiles({
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fe', function()
  builtin.oldfiles({
    cwd_only = true,
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
vim.keymap.set('n', '<leader>fw', function()
  local word = vim.fn.expand('<cWORD>')
  builtin.grep_string({
    search = word,
    layout_strategy = 'vertical',
    path_display = { 'filename_first' }
  })
end, {})
-- vim.keymap.set('n', '<leader>fs', function()
	-- builtin.grep_string({ search = vim.fn.input('grep > ') });
-- end)
