/**
 * This class contains various Window interaction methods
 * Parameters described here are available for most methods
 * thus only explained once here
 *
 * @Parameters
 *    @out             - [string] The name of the variable in which to store the result of SubCommand.
 *    @Cmd             - [string] The operation to perform, which if blank defaults to the ID
 *                                 sub-command.
 *                                 See https://www.autohotkey.com/docs/commands/WinGet.htm#SubCommands
 *    @WinTitle        - [string] A window title or other criteria identifying the target window.
 *    @WinText         - [string] If present, this parameter must be a substring from a single text element of the target window
 *                                (as revealed by the included Window Spy utility). Hidden text elements are detected
 *                                if DetectHiddenText is ON.
 *    @ExcludeTitle    - [string] Windows whose titles include this value will not be considered.
 *    @ExcludeText     - [string] Windows whose text include this value will not be considered.
 *
*/
class Window {
/**
 * Activates the specified window.
 *
 * @Parameters
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    activate(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        WinActivate , %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return
    }

/**
 * Retrieves the specified window's unique ID, process ID, process name, or a list of its controls.
 * It can also retrieve a list of all windows matching the specified criteria.
 *
 * @Parameters
 *    @Cmd
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    get(Cmd:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        WinGet, out, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return out
    }

/**
 * Retrieves the title of the active window
 *
 * @Return
 *    string
*/
    getActiveTitle() {
        WinGetActiveTitle, out
        return out
    }

/**
 * Retrieves the specified window's class name
 *
 * @Parameters
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    getClass(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        WinGetClass, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return out
    }

/**
 * Retrieves the text from the specified window
 *
 * @Parameters
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    getText(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        WinGetText, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return out
    }

/**
 * Retrieves the title from the specified window
 *
 * @Parameters
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    getTitle(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        WinGetTitle, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return out
    }

/**
 * Moves or resizes the specified window
 *
 * @Parameters
 *    @WinTitle
 *    @WinText
 *    @X        - [int] X coordinate of window
 *    @Y        - [int] Y coordinate of window
 *    @Width    - [int] width of window
 *    @Height   - [int] height of window
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    move(WinTitle:="", WinText:="", X:=0, Y:=0, Width:=1920, Height:=1080, ExcludeTitle:="", ExcludeText:="") {
        WinMove, %WinTitle%, %WinText%, %X%, %Y%, %Width%, %Height%, %ExcludeTitle%, %ExcludeText%
    }

/**
 * Retrieves the text from a standard status bar control.
 *
 * @Parameters
 *    @Part    - [int] which part number of the bar to retrieve, which can be an expression.
 *                     Default 1, which is usually the part that contains the text of interest.
 *    @WinTitle
 *    @WinText
 *    @ExcludeTitle
 *    @ExcludeText
 *
 * @Return
 *    string
*/
    statusBarGetText(Part:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
        StatusBarGetText, out, %Part%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
        return out
    }
}
