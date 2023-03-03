--[[
https://github.com/andymass/vim-matchup
Vim Script

Modern matchit implementation
vim match-up: even better % 👊 navigate and highlight matching words 👊

Adds motions g%, [%, ]%, and z%.
Combines these motions into convenient text objects i% and a%.
]]

vim.cmd( [[

""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" https://github.com/jdhao/nvim-config

" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

]] )

