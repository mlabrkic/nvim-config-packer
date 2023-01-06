#SingleInstance force


^F6::  ; CTRL+F6 hotkey

if WinExist("Tra")
{
    WinActivate  ; Automatically uses the window found above.
    WinMaximize  ; same
    ; Send, Some text.{Enter}
    return
}
