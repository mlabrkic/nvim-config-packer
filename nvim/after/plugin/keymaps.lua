--[[
init.lua
Basic Keymaps

help mapleader
The default leader key is backslash( \ ).
Set "space" as the leader key
]]
------------------------------------------------------------
--[[
:verbose nmap š

https://github.com/nanotee/nvim-lua-guide#vimkeymap
h vim.keymap.set()
h :map-arguments

vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

{opts} this must be a lua table.
Default options {opts}: {remap = false, silent = false, expr = false}
]]

--[[
https://github.com/nvim-lua/kickstart.nvim
LSP settings.
We'll write a basic lua function that wraps vim.keymap.set()
]]
local keymap = function( mode, key, result, desc )
  -- if desc then
  --   desc = 'LSP: ' .. desc
  -- end
  -- vim.keymap.set(mode, key, result, {remap = false, silent = true, desc = desc})
  vim.keymap.set( mode, key, result, { desc = desc, silent = true, } )
end

local keymapExpr = function( mode, key, result, desc )
  vim.keymap.set( mode, key, result, { desc = desc, silent = true, expr = true, } )
end

local keymapRemap = function( mode, key, result, desc )
  -- vim.keymap.set(mode, key, result, {remap = true, silent = true, desc = desc})
  vim.keymap.set( mode, key, result, { desc = desc, remap = true, } )
end

------------------------------------------------------------
-- https://github.com/jdhao/nvim-config

-- Remap for dealing with visual line wraps
-- Move the cursor based on physical lines, not the actual lines.
-- keymapExpr("n", "j", "v:count == 0 ? 'gj' : 'j'")
-- keymapExpr("n", "k", "v:count == 0 ? 'gk' : 'k'")

-- keymap("n", "^", "g^")
-- keymap("n", "0", "g0")

------------------------------
-- Go to start or end of line easier (0 and $)
-- h ^   To the first non-blank character of the line.
-- h g_  To the last non-blank character of the line

-- Go to start or end of line easier
keymap({ "n", "x" }, "H", "^")
keymap({ "n", "x" }, "L", "g_")

-- keymap({"n", "v"}, "gh", "^")
-- keymap({"n", "v"}, "gl", "g_")

-- gm  Like "g0", but half a screenwidth to the right (or as much as possible).

------------------------------------------------------------
-- "Descs" are copied from:
-- https://github.com/NvChad/NvChad
--[[
https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
h <C-L>
h CTRL-L
]]
-- keymap('n', '<Leader>l', '<Cmd>noh<CR>', '  Cancel search highlighting')
keymap('n', '<F2>', '<cmd>noh<CR>', '  Cancel search highlighting')

-- keymap('n', '<C-s>', '<cmd>update<cr>', '﬚  Save file if modified')

-- h rnu
keymap('n', '<F4>', '<cmd>set relativenumber!<cr>', 'Change: number <> relativnumber')
--[[
or
:QnumberRelativ
]]
------------------------------------------------------------
--[[
h jump-motions

CTRL-O
Go to [count] Older cursor position in jump list (not a motion command).

CTRL-I or <Tab>
Go to [count] newer cursor position in jump list (not a motion command).

:ju[mps]
Print the jump list (not a motion command).

h keycodes
]]

-- Because CTRL-I doesnt work after Tab remap :
-- https://superuser.com/questions/770068/in-vim-how-can-i-remap-tab-without-also-remapping-ctrli
-- First remap <tab> (and <c-i>) to <c-n>
keymap("n", "<C-N>", "<Tab>", "NEWER cursor position in jump list - replace CTRL-I")

-- Now remap <tab> to something else
keymap('n', '<Tab>', '%', 'Jump to matching pairs easily in normal mode')

--[[
==>
CTRL-O
Go to [count] Older cursor position in jump list (not a motion command).

CTRL-N
Go to [count] newer cursor position in jump list (not a motion command).

]]
------------------------------------------------------------
-- Insert --

-- Press jk fast to enter
keymap("i", "jj", "<ESC>")

-- Turn the word under cursor to UPPER case
-- inoremap <M-u> <Esc>viwUea
keymap('i', '<A-u>', '<Esc>viWU', "to UPPER case")

keymap('i', '<A-t>', '<Esc>viWUlveu', "to Title case")

-- <C-o>
-- While in insert mode, press <C-o> to temporarily leave insert mode and
-- execute a one-off normal command.

------------------------------------------------------------
-- https://github.com/jdhao/nvim-config

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
-- keymap("x", "<", "<gv")
-- keymap("x", ">", ">gv")

-- Indenting in visual mode
-- https://github.com/kristijanhusak/neovim-config
keymap('x', '<s-tab>', '<gv', 'Continuous visual shifting (does not exit Visual mode)')
keymap('x', '<tab>', '>gv', 'Continuous visual shifting (does not exit Visual mode)')

------------------------------
-- TODO:

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933
-- keymapExpr("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", "reselect last pasted area")

-- Select last pasted text
-- https://github.com/kristijanhusak/neovim-config
keymapExpr('n', 'gp', "'`[' . strpart(getregtype(), 0, 1) . '`]'", 'Select last pasted text')

------------------------------
-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
keymap("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", "Switch to the directory of the open buffer, and print cwd after that.")
keymap("t", "<Esc>", [[<c-\><c-n>]], "Use Esc to quit builtin terminal")

-- see also https://stackoverflow.com/q/10723700/6064933.
keymap("x", "p", '"_c<Esc>p', "Replace visual selection with text in register, but not contaminate the register.")

------------------------------
-- keyboard with Croatian characters
keymapRemap('n', 'č', ':', 'Enter command mode :')
keymapRemap('n', 'ć', '/', 'Enter command mode /')

------------------------------
-- Go to the beginning and end of current line in insert mode quickly
-- vim.keymap.set({'i', 'c'}, '<C-a>', '<Home>', {remap = true, desc = 'Go to the beginning of current line'})
-- vim.keymap.set({'i', 'c'}, '<C-e>', '<End>', {remap = true, desc = 'Go to the end of current line'})

-- Go to the beginning and end of current line in insert mode quickly
keymap("i", "<C-A>", "<HOME>")
keymap("i", "<C-E>", "<END>")

-- Go to beginning of command in command-line mode
keymap("c", "<C-A>", "<HOME>")

------------------------------
-- https://github.com/jdhao/nvim-config

-- Toggle cursor column (--> commands.lua)
-- keymap.set("n", "<leader>cl", "<cmd>call utils#ToggleCursorCol()<cr>", { desc = "toggle cursor column" })

-- Edit nvim config file quickly
keymap("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", "open init.lua")

------------------------------------------------------------
-- Always use very magic mode for searching
keymap("n", "/", [[/\v]])

-- https://vim.fandom.com/wiki/Keystroke_Saving_Substituting_and_Searching
-- Searching and Substituting for an arbitrary visually selected part of text

-- a) Searching for an arbitrary visually selected part of text
-- vnoremap/ y:execute "/".escape(@",'[]/\.*')<CR>
keymap('x', '/', [[y:execute "/".escape(@",'[]/\.*')<CR>]])

-- b) Substituting an arbitrary visually selected part of text
-- https://jdhao.github.io/2019/04/29/nvim_map_with_a_count/
-- INFO:   '<lt>Left><lt>Left>'

-- vnoremap <expr> <C-H> 'y:%s/' . escape(@",'[]/') . '//g<Left><Left>'
keymapExpr('x', '<C-H>', [['y:%s/' . escape(@",'[]/') . '//g<lt>Left><lt>Left>']])

-- nnoremap <expr> <C-H> ':%s/\<' . expand('<cword>') . '\>//g<Left><Left>'
keymapExpr('n', '<C-H>', [[':%s/\<' . expand('<cword>') . '\>//g<lt>Left><lt>Left>']])

-- https://github.com/mfussenegger/dotfiles/blob/master/vim/.config/nvim/lua/me/init.lua
-- h gn
-- vim.keymap.set('x', 'gs', [["sy:let @/=@s<CR>cgn]])
-- vim.keymap.set('n', 'gs', [[:let @/='\<'.expand('<cword>').'\>'<CR>cgn]])

--[[
:echo(expand('<cword>'))
The \< and \> ensure that only complete words are found (the search finds foo but not food).

h escape()
escape({string}, {chars})

Escape the characters in {chars} that occur in {string} with a
backslash.  Example:
  :echo escape('c:\program files\vim', ' \')
results in:
  c:\\program\ files\\vim

https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
https://vim.fandom.com/wiki/Search_and_replace
https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
]]
------------------------------
-- https://github.com/VonHeikemen/dotfiles

-- Begin a "searchable" macro
keymap('x', 'qi', [[y<cmd>let @/=substitute(escape(@", '/'), '\n', '\\n', 'g')<cr>gvqi]])

-- Apply macro in the next instance of the search
keymap('n', '<F8>', 'gn@i')

------------------------------------------------------------
-- keyboard with Croatian characters
-- :verbose nmap š
keymapRemap('n', 'š', '[', [[ Remap: 'š', '[' ]])
keymapRemap('n', 'đ', ']', [[ Remap: 'đ', ']' ]])

------------------------------
-- https://github.com/jdhao/nvim-config
-- Navigation in the location and quickfix list

-- :lopen
keymap("n", "[l", "<cmd>lprevious<cr>zv", "previous location item")
keymap("n", "]l", "<cmd>lnext<cr>zv", "next location item")

keymap("n", "[L", "<cmd>lfirst<cr>zv", "first location item")
keymap("n", "]L", "<cmd>llast<cr>zv", "last location item")

-- :copen
keymap("n", "[q", "<cmd>cprevious<cr>zv", "previous qf item")
keymap("n", "]q", "<cmd>cnext<cr>zv", "next qf item")

keymap("n", "[Q", "<cmd>cfirst<cr>zv", "first qf item")
keymap("n", "]Q", "<cmd>clast<cr>zv", "last qf item")

------------------------------------------------------------
-- Window movement commands (mappings optional):
-- <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb.

-- h CTRL-U
-- Scroll window Upwards in the buffer. (default: half a screen).

-- h CTRL-B ==> <PageUp>
-- h CTRL-F ==> <PageDown>

-- C-y, Scroll up, but cursor will not move
-- C-e, Scroll down, but curson will not move

-- https://github.com/tjdevries/config_manager
-- keymap("n", "<Up>", "2<C-e>", " scroll up")
-- keymap("n", "<Up>", "<C-e>", " scroll up")
keymap("n", "<C-Up>", "<C-e>", " scroll up")

-- keymap("n", "<Down>", "2<C-y>", " scroll down")
-- keymap("n", "<Down>", "<C-y>", " scroll down")
keymap("n", "<C-Down>", "<C-y>", " scroll down")

------------------------------------------------------------
-- https://github.com/mfussenegger/dotfiles
--[[
Splitting windows
h usr_08.txt
h CTRL-W
]]

-- Better window navigation
-- https://github.com/jdhao/nvim-config
-- keymap("n", "<C-h>", "<C-w>h", " window left")
-- keymap("n", "<C-l>", "<C-w>l", " window right")
-- keymap("n", "<C-j>", "<C-w>j", " window down")
-- keymap("n", "<C-k>", "<C-w>k", " window up")

-- Switch windows
keymap("n", "<left>", "<C-w>h", " window left")
keymap("n", "<Right>", "<C-w>l", " window right")
keymap("n", "<Down>", "<C-w>j", " window down")
keymap("n", "<Up>", "<C-w>k", " window up")

-- Builtin terminal
-- tnoremap <ESC>   <C-\><C-n>
-- keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
-- keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")
-- keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
-- keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")

keymap("t", "<left>", "<C-\\><C-n><C-w>h")
keymap("t", "<Right>", "<C-\\><C-n><C-w>l")
keymap("t", "<Down>", "<C-\\><C-n><C-w>j")
keymap("t", "<Up>", "<C-\\><C-n><C-w>k")

------------------------------------------------------------
-- https://github.com/folke/dot

-- Resize window using <Shift> arrow keys
-- https://github.com/folke/dot/tree/master/config/nvim
-- :h window-resize
-- <C-w>=
keymap("n", "<S-Up>", "<cmd>resize -2<CR>")
keymap("n", "<S-Down>", "<cmd>resize +2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

------------------------------
-- Switch buffers with arrow
-- keymap("n", "<Left>", "<cmd>bprevious<CR>")
-- keymap("n", "<Right>", "<cmd>bnext<CR>")

keymap("n", "<C-Left>", "<cmd>bprevious<CR>")
keymap("n", "<C-Right>", "<cmd>bnext<CR>")

------------------------------
keymap("n", "<BS>", "<C-^>", "Edit alternate buffer")

-- keyboard with Croatian characters
keymap("n", "ž", "<C-W>W", "Edit alternate window")

------------------------------
-- TODO:

-- Close all other buffers except current one
-- https://github.com/kristijanhusak/neovim-config
keymap('n', '<Leader>db', ':silent w <BAR> :silent %bd <BAR> e#<CR>')

-- Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933
-- keymap("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", "delete buffer")

------------------------------
-- C:\UTILS\Neovim\share\nvim\runtime\mswin.vim
-- Use CTRL-Q to do what CTRL-V used to do
-- noremap <C-Q>		<C-V>

keymap("n", "<C-q>", "<C-v>", "Enter visual block mode")

------------------------------------------------------------
--[[
https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

The default behavior in Neovim (and Vim) doesn't take into account the system clipboard.
It has its own mechanism to store text.
When we copy something using the y keybinding that text goes to an internal register.
I prefer to keep it that way, and what I do is create dedicated bindings to interact with the clipboard.

h registers
8. Selection registers "* and "+
Use these registers for storing and retrieving the selected text for the GUI.
]]

------------------------------
-- 1. The unnamed register ""
keymap('n', 'Y', 'yg_', 'Copy line to unnamed register "" (start from cursor pos)')

-- Paste, command (and insert) mode:  <CTRL-R>"

------------------------------
-- 8. Selection registers "* and "+
-- (Copy to system clipboard.)

-- A) Copy to system clipboard:

-- mswin.vim
keymap('x', '<C-c>', '"+y', '  Copy selected text to clipboard - Selection registers "* and "+')

keymap('n', '<C-y>', '"+yg_', '  Copy line (start from cursor position) to clipboard - Selection registers "* and "+')

-- vim.opt.iskeyword:append("-")
keymap('n', '<C-c>', '"+yiW', '  Copy WORD to clipboard - Selection registers "* and "+')
keymap('n', '<C-p>', '"+yiw', '  Copy word to clipboard - Selection registers "* and "+')

-- h CTRL-P
-- h CTRL-N

------------------------------
--[[
Delete without changing the registers
When we delete text in normal mode or visual mode using c, d or x that text goes to a register.
This affects the text we paste with the keybinding p.
]]
keymap({ 'n', 'x' }, 'x', '"_x')

------------------------------
-- B) Paste from system clipboard with Ctrl + v

-- vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', {remap = true, desc = 'Paste from clipboard'})
keymapRemap({ 'n', 'v' }, '<C-v>', '"+gP', 'Paste from clipboard = Insert from + register')

-- Paste, command (and insert) mode:  <CTRL-R>+
keymapRemap({ 'i', 'c' }, '<C-v>', '<C-R>+', 'Paste from clipboard = Insert from + register')

------------------------------------------------------------
-- C:\UTILS\Neovim\share\nvim\runtime\mswin.vim
-- Set options and add mapping such that Vim behaves a lot like MS-Windows

vim.cmd( [[

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
    " CTRL-X is Cut
    vnoremap <C-X> "+x
endif

" CTRL-Z is Undo
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c

]] )

