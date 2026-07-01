local treesitter = require('nvim-treesitter')
require('nvim-treesitter.config').setup({
  highlight = {
    enable = true,
  },
})

treesitter.install({
    'json',
    'javascript',
    'typescript',
    'tsx',
    'yaml',
    'html',
    'css',
    'python',
    'http',
    'prisma',
    'markdown',
    'markdown_inline',
    'svelte',
    'graphql',
    'bash',
    'lua',
    'vim',
    'dockerfile',
    'gitignore',
    'query',
    'vimdoc',
    'c',
    'cpp',
    'rust',
    'angular',
    'arduino',
    'astro',
    'awk',
    'dart',
    'jinja',
    'jinja_inline',
    'kotlin',
    'nginx',
    'perl',
    'php',
    'ruby',
    'scss',
    'terraform',
    'toml',
    'vue',
    'zsh'
})

-- according to the documentation, we have to manually attach treesitter to all available filetypes like so:
-- vim.api.nvim_create_autocmd("FileType", {
  -- pattern = '*',
  -- callback = function(args)
    -- Guard: some plugin UIs set special filetypes (e.g. TelescopePrompt)
    -- local bufnr = args.buf
    -- local ft = vim.bo[args.buf].filetype
    -- local bt = vim.bo[args.buf].buftype

    -- if bt ~= "" then return end
    -- if ft == "" then return end
    -- if ft:match('^Telescope') then return end

    -- Only start if a parser exists for this filetype
    -- local ok = pcall(vim.treesitter.language.get_lang, ft)
    -- if not ok then return end

    -- local lang = vim.treesitter.language.get_lang(ft)
    -- if not lang then return end

    -- Optional: ensure a parser can actually be created
    -- local ok_parser = pcall(vim.treesitter.get_parser, args.buf, lang)
    -- if not ok_parser then return end

    -- vim.treesitter.start(args.buf, lang)
  -- end,
-- })
