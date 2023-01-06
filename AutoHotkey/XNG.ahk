#SingleInstance force


^F3::  ; CTRL+F3 hotkey

if WinExist("Xng")
{
    WinActivate  ; Automatically uses the window found above.
    WinMaximize  ; same
    ; Send, Some text.{Enter}
    return
}
