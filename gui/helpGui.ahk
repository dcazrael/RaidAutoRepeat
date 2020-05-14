#SingleInstance force
SetBatchLines -1

Class helpGui extends GuiBase {
    Init() {
        width := 140
        height := 150
        this.windowSetup(width, height, "ffffff")
        this.AddText("w" . width-20 . " x10 y10 R1 +center", "Hotkeys")
        this.AddText("w" . width-20 . " x10 y+10 R1", "F1: Opens the help")
        this.AddText("w" . width-20 . " x10 y+10 R1", "F4: Starts/Stops the timer")
        this.AddText("w" . width-20 . " x10 y+10 R1", "F6: Resizes the active window")
        this.AddText("w" . width-20 . " x10 y+10 R1", "F7: Set maximum runs")
        this.AddText("w" . width-20 . " x10 y+10 R1", "F9: Opens settings")
    }

    /**
     * setting up window with size and background
     *
     * @Parameters
     *    @width            - [int] width value
     *    @height           - [int] height value
     *    @bg               - [string] background color name
     *    @transparency     - [int] transparency value
    */
    windowSetup(width, height, bg:="Default", transparency:=255) {
        this.Pos.W := width
        this.Pos.H := height
        this.Pos.X := A_ScreenWidth / 2 - width / 2
        this.Pos.Y := A_ScreenHeight / 2 - height / 2
        this.BackgroundColor := bg
    }

    /**
     * trigger for what happens when Escape is being pressed
    */
    Escape() {
        this.Destroy()
    }

    /**
     * trigger for "Close button" action
    */
    Close() {
        this.Hide()
    }
}
