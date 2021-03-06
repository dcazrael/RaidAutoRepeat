#SingleInstance force
SetBatchLines -1

Class SettingsGui extends GuiBase {
    Init() {
        width := 220
        height := 200
        this.settings_ini := A_ScriptDir . "\config.ini"
        this.loadSettings()
        this.windowSetup(width, height, "ffffff")
        this.AddText("w80 x10 y10 R1", "Sleep time")
        this.sleep_timer := this.AddEdit("w200 xp y+5", this.sleep_time).OnEvent(this.updateSleepTime.Bind(this))
        this.AddText("w80 x10 y+10 R1", "Emulator")
        this.emulator_title := this.AddEdit("w200 xp y+5", this.emulator).OnEvent(this.updateEmulatorTitle.Bind(this))
        this.AddText("w80 x10 y+10 R1", "Plarium Client")
        this.plarium_client_title := this.AddEdit("w200 xp y+5", this.pl_client).OnEvent(this.updatePlariumClientTitle.Bind(this))
        this.AddButton("w200 xp y+10", "Save").OnEvent(this.saveSettings.Bind(this))
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
     * load Settings from Ini file
     *
     * @Parameters
     *    @width            - [int] width value
     *    @height           - [int] height value
     *    @bg               - [string] background color name
     *    @transparency     - [int] transparency value
    */
    loadSettings() {
        this.sleep_time := iniRead(this.settings_ini, "settings", "timer")
        this.emulator := iniRead(this.settings_ini, "settings", "emulator")
        this.pl_client := iniRead(this.settings_ini, "settings", "pl_client")
    }

    /**
     * until "updatePlariumClientTitle" all methods are triggers for the editFields
    */
    updateSleepTime(Control) {
        this.sleep_time := Control.GuiControlGet()
    }

    updateEmulatorTitle(Control) {
        this.emulator := Control.GuiControlGet()
    }

    updatePlariumClientTitle(Control) {
        this.pl_client := Control.GuiControlGet()
    }

    /**
     * save Settings to Ini file
     *
     * @Parameters
     *    @width            - [int] width value
     *    @height           - [int] height value
     *    @bg               - [string] background color name
     *    @transparency     - [int] transparency value
    */
    saveSettings() {
        iniWrite(this.settings_ini, this.sleep_time, "settings", "timer")
        iniWrite(this.settings_ini, this.emulator, "settings", "emulator")
        iniWrite(this.settings_ini, this.pl_client, "settings", "pl_client")
        this.Destroy()
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
        this.saveSettings()
    }
}
