#SingleInstance force

; https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows

; ------------------------------------------------------------
; https://www.autohotkey.com/docs/Hotkeys.htm
;  #	Win (Windows logo key).
;  !	Alt
;  ^	Ctrl
;  +	Shift
;  &	An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. 

; Ctrl+Alt+A --> ^!a

; https://www.autohotkey.com/docs/KeyList.htm
; https://www.autohotkey.com/docs/commands/Send.htm

; ------------------------------------------------------------
; The following AutoHotKey script tries to emulate an idea I read about from Steve Losh
; where he overloaded his CapsLock key to do the following:
; pressing CapsLock and another key is equivalent to pressing Ctrl and the other key,
; but pressing and releasing CapsLock is equivalent to pressing Escape.

; Sends Esc if capslock is pressed alone
; Sends Ctrl+key if capslock is pressed with another key
; TODO: work with arrow keys and other modifiers (e.g. shift, control)


SetCapsLockState AlwaysOff
CapsLock::Send {esc}
CapsLock & a::Send ^a
CapsLock & b::Send ^b
CapsLock & c::Send ^c
CapsLock & d::Send ^d
CapsLock & e::Send ^e
CapsLock & f::Send ^f
CapsLock & g::Send ^g
CapsLock & h::Send ^h
CapsLock & i::Send ^i
CapsLock & j::Send ^j
CapsLock & k::Send ^k
CapsLock & l::Send ^l
CapsLock & m::Send ^m
CapsLock & n::Send ^n
CapsLock & o::Send ^o
CapsLock & p::Send ^p
CapsLock & q::Send ^q
CapsLock & r::Send ^r
CapsLock & s::Send ^s
CapsLock & t::Send ^t
CapsLock & u::Send ^u
CapsLock & v::Send ^v
CapsLock & w::Send ^w
CapsLock & x::Send ^x
CapsLock & y::Send ^y
CapsLock & z::Send ^z
CapsLock & 0::Send ^0
CapsLock & 1::Send ^1
CapsLock & 2::Send ^2
CapsLock & 3::Send ^3
CapsLock & 4::Send ^4
CapsLock & 5::Send ^5
CapsLock & 6::Send ^6
CapsLock & 7::Send ^7
CapsLock & 8::Send ^8
CapsLock & 9::Send ^9
; how to scape ` and ; ?
; CapsLock & `::Send ^`
; CapsLock & ; ::Send ^;
CapsLock & '::Send ^'
CapsLock & ,::Send ^,
CapsLock & .::Send ^.
CapsLock & /::Send ^/
CapsLock & -::Send ^-
CapsLock & =::Send ^=
CapsLock & [::Send ^[
CapsLock & ]::Send ^]


; mlabrkic
; https://www.autohotkey.com/docs/commands/Send.htm
; Send ^{PgUp} presses Ctrl+PgUp
CapsLock & PgUp::Send ^{PgUp}
CapsLock & PgDn::Send ^{PgDn}

CapsLock & Up::Send ^{Up}
CapsLock & Down::Send ^{Down}
CapsLock & Left::Send ^{Left}
CapsLock & Right::Send ^{Right}

CapsLock & Home::Send ^{Home}
CapsLock & End::Send ^{End}

CapsLock & Space::Send ^{Space}
CapsLock & Tab::Send ^{Tab}

CapsLock & Backspace::Send ^{Backspace}
