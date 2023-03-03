-- https://github.com/phaazon/hop.nvim

-- ---------------------------------------------------------
-- :h hop-config

-- Hop is an EasyMotion-like plugin
-- allowing you to jump anywhere in a document with as few keystrokes as possible.

-- https://github.com/jdhao/nvim-config
  -- use {
  --   'phaazon/hop.nvim',
  --   event = "VimEnter",
  --   config = function()
  --     -- vim.defer_fn(function() require('config.nvim_hop') end, 2000)
  --     vim.defer_fn(function() require('plugins.nvim_hop') end, 2000)
  --   end
  -- }

-- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_patterns()<cr>", {noremap = true})

-- :HopPattern: hop around by matching against a pattern (as with /).

vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

require('hop').setup( {
  case_insensitive = true,
  char2_fallback_key = '<CR>',
} )

-- Type a bigram:
vim.api.nvim_set_keymap( 'n', 'f', "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true} )

-- vim.api.nvim_set_keymap('n', '<Leader><Leader>/', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
-- vim.api.nvim_set_keymap('n', '<Leader><Leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", {})
-- vim.api.nvim_set_keymap('n', '<Leader><Leader>l', "<cmd>lua require'hop'.hint_lines()<cr>", {})

