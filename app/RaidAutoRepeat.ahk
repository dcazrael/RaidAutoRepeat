Class RaidAutoRepeat {

    __New() {
        this.startMainGui()
        this.createConfig()
        this.window := new Window()
    }

    /**
     * sets up the GUI elements
    */
    startMainGui() {
        this.main_gui := new MainGui("Raid Auto Repeater", "+Border +AlwaysOnTop +ToolWindow -Caption")
        this.addTrayMenu()
        this.settings := new SettingsGui("Settings", "+ToolWindow")
        this.main_gui.Show()
    }

    /**
     * Opens a Settings Window
    */
    showSettings() {
        this.settings := new SettingsGui("Settings", "+ToolWindow")
        this.settings.Show()
    }

    /**
     * Adds Settings to the Tray Menu
    */
    addTrayMenu() {
        show_settings := ObjBindMethod(this, "showSettings")
        Menu, Tray, Add
        Menu, Tray, Add, Settings, % show_settings
        Menu, Tray, Default, Settings
    }

    /**
     * Sends R to the Client and loops until the hotkey is pressed again.
     * Updates the GUI with the sleep timer
    */
    repeat() {
        if (this.toggle) {
            sleep_time := this.settings.sleep_time
            this.main_gui.status_text.SetText("Enabled")
            this.main_gui.delay_text.SetText(sleep_time . " seconds")
            this.main_gui.setTransparency(155)
            loop {
                if (!this.toggle) {
                    this.main_gui.status_text.SetText("Disabled")
                    this.main_gui.setTransparency(10)
                    break
                }
                previous_window := this.Window.getActiveTitle()
                this.Window.activate("ahk_exe " . this.settings.emulator . ".exe")
                sleep 700
                ControlSend, , r, % "ahk_exe " . this.settings.emulator . ".exe"
                sleep 1000
                this.Window.activate(this.settings.pl_client)
                sleep 700
                ControlSend, , r, % this.settings.pl_client
                sleep 300
                this.Window.activate(previous_window)
                Loop, %sleep_time% {
                    if (!this.toggle) {
                        break
                    }
                    sleep 1000
                }
            }
        }

        return
    }

    /**
     * Resizes the active Window and moves it
    */
    resizeAndMove() {
        if (this.toggle) {
            current_window := this.Window.getActiveTitle()
            this.Window.move(current_window) ; resize to 1920x1080 and move to 0, 0
        } else {
            current_window := this.Window.getActiveTitle()
            width := 760
            height := 480
            x := A_ScreenWidth-width
            y := A_ScreenHeight-height-25
            this.Window.move(current_window, , x, y, width, height)
        }
        return
    }

    /**
     * Checks if config file is present
     * Creates the file if not present
    */
    createConfig() {
        if (!FileExist(FilePattern)) {
            config_file := A_ScriptDir . "\config.ini"
            iniWrite(config_file, 20, "settings", "timer")
            iniWrite(config_file, "BlueStacks", "settings", "emulator")
            iniWrite(config_file, "Raid: Shadow Legends", "settings", "pl_client")
        }
        return
    }
}
