#SingleInstance force


^F7::  ; CTRL+F7 hotkey

if WinExist("Izvr")
{
    WinActivate  ; Automatically uses the window found above.
    WinMaximize  ; same
    ; Send, Some text.{Enter}
    return
}
