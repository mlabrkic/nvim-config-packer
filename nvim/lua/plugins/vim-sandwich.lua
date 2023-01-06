-- https://github.com/machakann/vim-sandwich

-- Plugin to manipulate character pairs quickly
  -- use({'machakann/vim-sandwich', event = "VimEnter"}) -- saiw" , sr"( , sd(

------------------------------
-- Add:      saiw(         makes foo   to  (foo)
-- sa{motion/textobject}{addition}

-- Delete:   sdb or sd(    makes (foo) to  foo
-- sdb or sd{deletion}

-- Replace:  srb" or sr("  makes (foo) to "foo"
-- srb{addition}  or  sr{deletion}{addition}

------------------------------
-- Pioneers:
-- use 'tpope/vim-surround' -- ysiw" , cs"' , ds'

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

-- Input	Name	Examples
-- f / F	Function surroundings	arg -> func(arg)
-- i / I	Instant surroundings	text -> [before]text[after]
-- t / T	HTML style tags	text -> <p>text</p>

------------------------------
-- Map s to nop since s in used by vim-sandwich. Use cl instead of s.
vim.cmd( [[
nmap s <Nop>
omap s <Nop>
]] )

