-- See :help bufferline-settings
require('bufferline').setup( {
  options = {
    mode = 'buffers',
    numbers = "buffer_id",
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'Function' },
      italic = false
    }
  }
} )

