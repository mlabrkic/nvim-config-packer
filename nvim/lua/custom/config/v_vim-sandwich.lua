--[[
https://github.com/machakann/vim-sandwich
Vim Script

Plugin to manipulate character pairs quickly
saiw" , sr"( , sd(

------------------------------
Add:  saiw(               makes foo   to  (foo)
Delete:  sdb or sd(
Replace:  srb" or sr("    makes (foo) to "foo"

Visual mode:
sa"

]]
------------------------------
-- visual selection:
-- Vsa"

-- " press V2jsd
--     {      --->  foo
--       foo
--     }

-- " press <C-v>2j2lsa(
--     foo        (foo)
--     bar  --->  (bar)
--     baz        (baz)

-- There is an option to skip white space skip_space, it is valid in default. Empty line is ignored.
-- " press <C-v>3j$sa(
--     fooooooo            (fooooooo)
--       baaaar   --->       (baaaar)

--     baaaz               (baaaz)

------------------------------
-- https://github.com/machakann/vim-sandwich/wiki/Magic-characters

------------------------------
-- Map s to nop since s in used by vim-sandwich. Use cl instead of s.

vim.cmd( [[
nmap s <Nop>
omap s <Nop>
]] )

