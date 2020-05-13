#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#MaxThreadsPerHotkey 2
SetTitleMatchMode, 2

std_lib()

#include %A_ScriptDir%\gui\MainGui.ahk
#include %A_ScriptDir%\gui\SettingsGui.ahk
#include %A_ScriptDir%\gui\GuiBase.ahk

#include %A_ScriptDir%\app\RaidAutoRepeat.ahk

rar := new RaidAutoRepeat()

F4::
    rap.toggle := !rap.toggle
    if (rap.toggle) {
        rap.repeat()
    } else {
        tooltip("Turning RAR off", 1500)
    }
    return

F6::
    rar.toggle := !rap.toggle
    rar.resizeAndMove()
    return

F9::
    rar.showSettings()
    return
