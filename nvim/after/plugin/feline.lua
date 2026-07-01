local present, feline = pcall(require, 'feline')
if not present then return end

--- Customizations ---
local theme = {
  fg = '#ebdbb2',
  bg = '#3c3836',
  black = '#3c3836',
  skyblue = '#83a598',
  cyan = '#8e07c',
  green = '#b8bb26',
  oceanblue = '#076678',
  blue = '#458588',
  magenta = '#d3869b',
  orange = '#d65d0e',
  red = '#fb4934',
  violet = '#b16286',
  white = '#ebdbb2',
  yellow = '#fabd2f',
  aqua = '#8ec07c',
  darkred = '#cc241d',
  gray = '#928374',
  lime = '#b8bb26',
  pink = '#d3869b',
  purple = '#b16286',
}

local mode_theme = {
  ['NORMAL'] = theme.green,
  ['OP'] = theme.cyan,
  ['INSERT'] = theme.aqua,
  ['VISUAL'] = theme.yellow,
  ['LINES'] = theme.darkred,
  ['BLOCK'] = theme.orange,
  ['REPLACE'] = theme.purple,
  ['V-REPLACE'] = theme.pink,
  ['ENTER'] = theme.pink,
  ['MORE'] = theme.pink,
  ['SELECT'] = theme.darkred,
  ['SHELL'] = theme.cyan,
  ['TERM'] = theme.lime,
  ['NONE'] = theme.gray,
  ['COMMAND'] = theme.blue,
}

local modes = setmetatable({
  ['n'] = 'N',
  ['no'] = 'N',
  ['v'] = 'V',
  ['V'] = 'VL',
  [''] = 'VB',
  ['s'] = 'S',
  ['S'] = 'SL',
  [''] = 'SB',
  ['i'] = 'I',
  ['ic'] = 'I',
  ['R'] = 'R',
  ['Rv'] = 'VR',
  ['c'] = 'C',
  ['cv'] = 'EX',
  ['ce'] = 'X',
  ['r'] = 'P',
  ['rm'] = 'M',
  ['r?'] = 'C',
  ['!'] = 'SH',
  ['t'] = 'T',
}, { __index = function() return '-' end })
--

-- Components ---
local component = {}

component.vim_mode = {
  provider = function() return modes[vim.api.nvim_get_mode().mode] end,
  hl = function()
    return {
      fg = 'bg',
      bg = require('feline.providers.vi_mode').get_mode_color(),
      style = 'bold',
      name = 'NeovimModeHLColor',
    }
  end,
  left_sep = 'block',
  right_sep = 'block',
}

function wrap(string)
  return ' ' .. string .. ' '
end

function provide_filename(component, opts)
  local filename = vim.api.nvim_buf_get_name(0)
  if filename == '' then
    filename = '[no name]'
  end
  -- this is some vim magic to remove the current working directory path
  -- from the absilute path of the filename in order to make the filename
  -- relative to the current working directory
  return vim.fn.fnamemodify(filename, ':~:.')
end

function wrapped_provider(provider, wrapper)
  return function(component, opts)
    return wrapper(provider(component, opts))
  end
end

component.filename = {
  provider = wrapped_provider(provide_filename, wrap),
  hl = {
    bg = 'bg',
    fg = 'fg',
  },
  left_sep = 'block',
  right_sep = 'block',
}

component.git_branch = {
  provider = 'git_branch',
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'bold',
  },
  left_sep = 'block',
  right_sep = '',
}

component.git_add = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
  },
  left_sep = '',
  right_sep = '',
}

component.git_delete = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
  },
  left_sep = '',
  right_sep = '',
}

component.git_change = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'purple',
    bg = 'bg',
  },
  left_sep = '',
  right_sep = '',
}

component.separator = {
  provider = '',
  hl = {
    fg = 'bg',
    bg = 'bg',
  },
}

component.diagnostic_errors = {
  provider = 'diagnostic_errors',
  hl = {
    fg = 'red',
  },
}

component.diagnostic_warnings = {
  provider = 'diagnostic_warnings',
  hl = {
    fg = 'yellow',
  },
}

component.diagnostic_hints = {
  provider = 'diagnostic_hints',
  hl = {
    fg = 'aqua',
  },
}

component.diagnostic_info = {
  provider = 'diagnostic_info',
}

component.lsp = {
  provider = function()
    if not rawget(vim, 'lsp') then
      return ''
    end

    local progress = vim.lsp.status()[1]
    if vim.o.columns < 120 then
      return ''
    end

    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients ~= 0 then
      if progress then
        local spinners = {
          '◜ ',
          '◠ ',
          '◝ ',
          '◞ ',
          '◡ ',
          '◟ ',
        }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        local content = string.format('%%<%s', spinners[frame + 1])
        return content or ''
      else
        return 'לּ LSP'
      end
    end
    return ''
  end,
  hl = function()
    local progress = vim.lsp.status()[1]
    return {
      fg = progress and 'yellow' or 'green',
      bg = 'gray',
      style = 'bold',
    }
  end,
  left_sep = '',
  right_sep = 'block',
}

component.file_type = {
  provider = {
    name = 'file_type',
    opts = {
      filetype_icon = true,
    },
  },
  hl = {
    fg = 'fg',
    bg = 'gray',
  },
  left_sep = 'block',
  right_sep = 'block',
}

component.scroll_bar = {
  provider = function()
    local chars = setmetatable({
      ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
      ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
    }, { __index = function() return ' ' end })
    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    local position = math.floor(line_ratio * 100)

    local icon = chars[math.floor(line_ratio * #chars)] .. position
    if position <= 5 then
      icon = ' TOP'
    elseif position >= 95 then
      icon = ' BOT'
    end
    return icon
  end,
  hl = function()
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    local fg
    local style

    if position <= 5 then
      fg = 'aqua'
      style = 'bold'
    elseif position >= 95 then
      fg = 'red'
      style = 'bold'
    else
      fg = 'purple'
      style = nil
    end
    return {
      fg = fg,
      style = style,
      bg = 'bg',
    }
  end,
  left_sep = 'block',
  right_sep = 'block',
}

-- Arrangements --
vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#3c3836', fg = '#fbf1c7' })
feline.setup({
  components = {
    active = {
      {   -- left
        component.vim_mode,
        component.file_type,
        component.filename,
      },
      {}, -- middle
      {   -- right
        component.lsp,
        component.git_branch,
        component.git_add,
        component.git_delete,
        component.git_change,
        component.separator,
        component.diagnostic_errors,
        component.diagnostic_warnings,
        component.diagnostic_info,
        component.diagnostic_hints,
        component.scroll_bar,
      },
    },
  },
  theme = theme,
  vi_mode_colors = mode_theme,
})
