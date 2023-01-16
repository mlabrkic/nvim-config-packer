-- https://github.com/kevinhwang91/nvim-hlslens

-- ---------------------------------------------------------
-- https://github.com/jdhao/nvim-config
  -- use {
  --   'kevinhwang91/nvim-hlslens',
  --   branch = 'main',
  --   keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
  --   -- config = [[require('config.hlslens')]]
  --   config = [[require('plugins.hlslens')]]
  -- }

-- lua
require('hlslens').setup( {
    calm_down = true,
    nearest_only = true,
    -- nearest_float_when = 'always'
} )


local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts) -- zz
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts) -- zz
vim.api.nvim_set_keymap('n', '*', [[*zz<Cmd>lua require('hlslens').start()<CR>]], kopts) -- zz
vim.api.nvim_set_keymap('n', '#', [[#zz<Cmd>lua require('hlslens').start()<CR>]], kopts) -- zz
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

