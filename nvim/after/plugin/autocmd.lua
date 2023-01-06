---------------------- AUTOCOMMANDS ------------------------

------------------------------------------------------------
-- Autocommand 01:
-- Go to last loc when opening a buffer

local mygroup = vim.api.nvim_create_augroup( 'user_cmds', { clear = true } )

vim.api.nvim_create_autocmd( 'BufReadPost', {
  group = mygroup,
  pattern = '*',
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd( [[normal! g`"]] )
    end
  end,
} )

------------------------------------------------------------
-- Autocommand 02:
-- Display a message when the current file is not in utf-8 format.

-- https://github.com/jdhao/nvim-config
-- Note that we need to use `unsilent` command here because of this issue:
-- https://github.com/vim/vim/issues/4379
vim.api.nvim_create_autocmd( { "BufRead" }, {
  pattern = "*",
  group = vim.api.nvim_create_augroup( "non_utf8_file", { clear = true } ),
  callback = function()
    if vim.bo.fileencoding ~= "utf-8" then
      vim.notify( "File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" } )
    end
  end,
} )


------------------------------------------------------------
vim.cmd( [[
" ------------------------------------------------------------
" Autocommand 03:
" Templates

augroup nvim_templates
  au!
  " read in templates files
  autocmd bufnewfile *.* silent! execute '0r ' . stdpath("config")  . "\\templates\\" . expand("%:e") . ".tpl"
augroup end

" :h :e[dit]

" usage:
" :e example1.py
" press enter

" -->
" #!/usr/bin/env python3

" ------------------------------------------------------------
" Autocommand 04:
" Show cursor line only in active window

" https://github.com/folke/dot/tree/master/config/nvim
" https://github.com/tjdevries/config_manager
augroup nvim_cursorline
  au!
  autocmd insertleave,winenter * set cursorline
  autocmd insertenter,winleave * set nocursorline
augroup end

" ------------------------------------------------------------
" Autocommand 05:
" Terminal

augroup nvim_opts
    au!
    " au filetype markdown,rst,text,mail execute source stdpath("config") . "\\" . "prose.vim"
    au termopen * setlocal nonumber norelativenumber signcolumn=no
augroup end

" ------------------------------------------------------------


]] )

------------------------------------------------------------
-- windows to close with "q"
-- vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
-- vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])


-- https://github.com/VonHeikemen/nvim-starter/blob/04-lsp-installer/init.lua
--[[
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = mygroup,
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})
 ]]

------------------------------------------------------------
-- Auto-create dir when saving a file, in case some intermediate directory does not exist

-- https://github.com/jdhao/nvim-config
-- https://jdhao.github.io/2022/08/21/you-do-not-need-a-plugin-for-this/

--[[
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  pattern = "*",
  callback = function(ctx)
    local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
    vim.fn.mkdir(dir, "p")
  end
})
]]

------------------------------------------------------------


-- ############################################################

--[[
:h autocmd

:h autocmd-list
autocmd TextYankPost

:h autocmd-remove
:au[tocmd]! [group]	- Remove ALL autocommands.
autocmd!  - When the [group] argument is not given, Vim uses the current group

:h events

:h <afile>
When executing autocommands, is replaced with the file name of the buffer being manipulated
]]

------------------------------
--[[
NEW:
https://github.com/nanotee/nvim-lua-guide#defining-autocommands
Neovim 0.7.0 has API functions for autocommands.
:help api-autocmd
]]

