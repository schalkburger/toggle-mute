Menu, Tray, Icon, ToggleMute.ico ; use a valid icon file name
Gui, Hide
return

toggle :=0
Pause::
    toggle := !toggle
    if toggle
{
    ; Menu, Tray, Icon, MicUnmuted.ico ; use a valid icon file name
    send, +{Pause down}{Pause up}
}
    else
{
    ; Menu, Tray, Icon, MicMuted.ico ; use a valid icon file name
    send, +{Pause down}{Pause up}
}
return

+Pause::  ;Pause Break button is my chosen hotkey

SoundSet, +1, MASTER, mute,7 ;12 was my mic id number use the code below the dotted line to find your mic id. you need to replace all 12's  <---------IMPORTANT
SoundGet, master_mute, , mute, 7

if (master_mute = "Off") {
    ; MsgBox, The microphone is not muted.
    Menu, Tray, Icon, MicUnmuted.ico ; use a valid icon file name
}
else {
    ;  MsgBox, The microphone is muted.
     Menu, Tray, Icon, MicMuted.ico ; use a valid icon file name
}

ToolTip, Mute %master_mute%, (A_ScreenWidth / 2), A_ScreenHeight ;use a tool tip at mouse pointer to show what state mic is after toggle
SetTimer, RemoveToolTip, 500
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return