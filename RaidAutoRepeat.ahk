#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#MaxThreadsPerHotkey 2
SetTitleMatchMode, 2

std_lib()

#include %A_ScriptDir%\gui\MainGui.ahk
#include %A_ScriptDir%\gui\SettingsGui.ahk
#include %A_ScriptDir%\gui\HelpGui.ahk
#include %A_ScriptDir%\gui\GuiBase.ahk

#include %A_ScriptDir%\app\RaidAutoRepeat.ahk

rar := new RaidAutoRepeat()

F1::
    rar.showHelp()
    return

F4::
    rar.toggle := !rar.toggle
    if (rar.toggle) {
        rar.repeat()
    } else {
        tooltip("Turning RAR off", 1500)
    }
    return

F6::
    rar.toggle := !rar.toggle
    rar.resizeAndMove()
    return

F7::
    rar.setMaxIterations()
    return

F9::
    rar.showSettings()
    return
