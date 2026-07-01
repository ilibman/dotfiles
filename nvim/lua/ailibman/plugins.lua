-- :h packages

-- theme --
vim.pack.add { 'https://github.com/feline-nvim/feline.nvim' }
vim.pack.add { 'https://github.com/morhetz/gruvbox.git' }
vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
vim.g.gruvbox_contrast_dark = 'soft'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_comments = 1
vim.g.gruvbox_italicize_strings = 1
vim.cmd.colorscheme('gruvbox')
--- tabline config is in a dedicated file ---

vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
vim.pack.add { 'https://github.com/nvim-telescope/telescope.nvim' }
-- vim.pack.add({
--   {
--        name = 'telescope-fzf-native',
--        src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
--        build = 'make'
--    }
-- })
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }
vim.pack.add { 'https://github.com/echasnovski/mini.files' }
vim.pack.add { 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring' }
vim.pack.add { 'https://github.com/echasnovski/mini.comment' }
vim.pack.add { 'https://github.com/echasnovski/mini.surround' }
vim.pack.add { 'https://github.com/echasnovski/mini.splitjoin' }
vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }

-- git --
vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }
vim.pack.add { 'https://github.com/NeogitOrg/neogit' }

-- LSP --
vim.pack.add { 'https://github.com/williamboman/mason-lspconfig.nvim' }
vim.pack.add { 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }
vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }
vim.pack.add { 'https://github.com/williamboman/mason.nvim' }
vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }
