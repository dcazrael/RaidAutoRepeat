#SingleInstance force
SetBatchLines -1

Exit(ByRef gui_class) {
    gui_class.Destroy()
    gui_class := ""
    ExitApp
}

Class MainGui extends GuiBase {
    Init() {
        width := 120
        height := 65
        this.windowSetup(width, height, "ffffff", 10)
        this.title := this.AddText("w" . width-20 . " x10 c111111 R1 +center", "Raid Auto Repeater")
        this.status_text := this.AddText("w" . width-20 . " x10 c111111 R1 +center", "Disabled")
        this.delay_text := this.AddText("w" . width-20 . " x10 c111111 R1 +center", "")
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
        this.Pos.X := A_ScreenWidth-width-10
        this.Pos.Y := A_ScreenHeight-height-35
        this.BackgroundColor := bg
        this.Options("+LastFound")
        WinSet, TransColor, EEAA99 %transparency%
        WinSet, ExStyle, % "+0x20"
    }

    setTransparency(transparency) {
        this.Options("+LastFound")
        WinSet, TransColor, EEAA99 %transparency%
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
        Exit(this)
    }
}
