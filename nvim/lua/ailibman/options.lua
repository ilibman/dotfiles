-- general --
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true    -- needed for theme/tabline
vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = ''
vim.opt.wrap = false            -- don't wrap lines
vim.opt.timeout = false         -- turn off timeout for a keystroke
vim.g.editorconfig = true       -- somehow makes editing consistent across... whatever
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/nvim/undo')
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.redrawtime = 10000      -- better performance
vim.opt.maxmempattern = 20000

-- indentation --
vim.opt.tabstop = 2             -- tab width
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2          -- indent width
vim.opt.expandtab = true        -- cast tabs into spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search --
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- autocomplete --
vim.opt.autocomplete = true
vim.opt.completeopt = { 'fuzzy', 'menu', 'menuone', 'popup', 'preview' }  -- autocomplete menu config
vim.opt.complete = { '.', 'w', 'b' }  -- i only want to autocomplete from the opened buffers

-- misc shit in buffer --
vim.opt.cursorline = true
vim.opt.scrolloff = 8           -- keep min 8 lines around the cursor
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.backspace = {'start', 'eol', 'indent'}
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
}
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ✘",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " 󰙎",
      [vim.diagnostic.severity.HINT]  = " ⚑",
    },
  },
})

local undodir = vim.fn.expand('~/nvim/undo')
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
