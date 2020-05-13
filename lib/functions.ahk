/**
 * Command Functions
        A wrapper set of functions for commands which have an output variable.
 *
 * @Return
 *    Boolean
 *
 * @Remarks
 *     autohotkey quirk - a function with the same name as the filename 
 *     can be used to automatically include the file as library on call
 *     this way, we don't have to include this file, but just call the 
 *     function "Functions" and use it as libary
*/
Functions() {
    return true
}

/**
 * Checks whether a variable's contents partially match one of the items in a list.
 * var can be an int and still be compared
 *
 * @Parameters
 *    @var           - [string][int] can be either int or string
 *    @list_items    - [string][object] list of items, either in an object or in a delimiter
 *                                      separated string without spaces; e.g "1,2,3"
 *
 * @Return
 *    boolean
 *
 * @Remarks
 *    The comparison is always done alphabetically, not numerically. 
 *    For example, the string "11" would not match the list item "11.0".
*/
contains(ByRef var, list_items*) {
    for each, item in list_items {
        if (!!InStr(item, var) == 1) {
            return true
        }
    }
    return false
}

/**
 * adds time to existing time variable
 *
 * @Parameters
 *    @dateTime     - [string] name of the variable upon which to operate
 *                             usually contains a time string
 *    @time         - [various] any integer, floating point number, or expression
 *                              specify a negative number to perform subtraction
 *    @timeUnits    - [string] TimeUnits can be either Seconds, Minutes, Hours, or Days 
 *                             (or just the first letter of each of these)
 *
 * @Return
 *    Return
*/
dateAdd(dateTime, time, timeUnits) {
    EnvAdd, DateTime, % Time, % TimeUnits
    return DateTime
}

/**
 * returns the difference between two dates/times
 *
 * @Parameters
 *    @dateTime1    - [string] name of the variable upon which to operate
 *    @dateTime2    - [various] any integer, floating point number, or expression 
 *                              (expressions are not supported when TimeUnits is present)
 *    @timeUnits    - [string] TimeUnits can be either Seconds, Minutes, Hours, or Days 
 *                             (or just the first letter of each of these)
 *
 * @Return
 *    Return
*/
dateDiff(dateTime1, dateTime2, timeUnits) {
    EnvSub, DateTime1, % DateTime2, % TimeUnits
    return DateTime1
}

/**
 * Retrieves various types of information about the computer's drive(s)
 *
 * @Parameters
 *    @Cmd      - [string] https://www.autohotkey.com/docs/commands/DriveGet.htm#SubCommands
 *    @Value    - [string] https://www.autohotkey.com/docs/commands/DriveGet.htm#SubCommands
 *
 * @Return
 *    depends on Cmd
 *
 * @Remarks
 *     Cmd and Value parameters are dependent upon each other
*/
driveGet(Cmd, Value:="") {
    DriveGet, out, %Cmd%, %Value%
    return out
}

/**
 * Retrieves the free disk space of a drive, in Megabytes
 *
 * @Parameters
 *    @Path    - [string] path of drive to receive information from
 *
 * @Return
 *    int
*/
driveSpaceFree(Path) {
    DriveSpaceFree, out, %Path%
    return out
}

/**
 * Retrieves an environment variable.
 *
 * @Parameters
 *    @%EnvVarName%    - [string] The name of the environment variable to retrieve. For example: Path
 *
 * @Return
 *    string
*/
envGet(EnvVarName) {
    EnvGet, out, %EnvVarName%
    return out
}

fileAppend(text, fileName, encoding:="UTF-8") {
    FileAppend, % text, % fileName, % encoding
}

/**
 * Copies one or more files.
 *
 * @Parameters
 *    @SourcePattern    - [string] name of a single file or folder, or a wildcard 
 *                                 pattern such as C:\Temp\*.tmp. 
 *                                 SourcePattern is assumed to be in %A_WorkingDir%, 
 *                                 if an absolute path isn't specified.
 *    @DestPattern      - [string] name or pattern of the destination, which is assumed to 
 *                                 be in %A_WorkingDir% if an absolute path isn't specified. 
 *                                 The destination directory must already exist.
 *    @Overwrite        - [boolean] determines whether to overwrite files if they already exist. 
 *                                  If this parameter is 1 (true), the command overwrites existing 
 *                                  files. If omitted or 0 (false), the command does not overwrite 
 *                                  existing files.
 *
 * @Return
 *    no return value
*/
fileCopy(SourcePattern, DestPattern, Overwrite:=0) {
    FileCopy, % SourcePattern, % DestPattern , % Overwrite
}

/**
 * Creates a directory/folder.
 *
 * @Parameters
 *    @DirName    - [string] Name of the directory to create, which is assumed to be in 
 *                           %A_WorkingDir% if an absolute path isn't specified.
 *
 * @Return
 *    no return value
 *
 * @Remarks
 *     This command will also create all parent directories given in DirName if they do not already exist.
*/
fileCreateDir(DirName) {
    FileCreateDir, % DirName
}

/**
 * Deletes one or more files.
 *
 * @Parameters
 *    @FilePattern    - [string] The name of a single file or a wildcard pattern such as "C:\Temp\*.tmp"
 *
 * @Return
 *    no return value
*/
fileDelete(FilePattern) {
    FileDelete, % FilePattern
}


/**
 * Reports whether a file or folder is read-only, hidden, etc.
 *
 * @Parameters
 *    @Filename    [string] name of the target file, which is assumed to be in %A_WorkingDir% if an absolute path isn't specified
 *
 * @Return
 *    string
*/
fileGetAttrib(Filename:="") {
    FileGetAttrib, out, %Filename%
    return out
}

/**
 * Retrieves information about a shortcut (.lnk) file, such as its target file
 *
 * @Parameters
 *    Parameters
 *
 * @Return
 *    Return
*/
fileGetShortcut(LinkFile, ByRef OutTarget:="", ByRef OutDir:="", ByRef OutArgs:="", ByRef OutDescription:="", ByRef OutIcon:="", ByRef OutIconNum:="", ByRef OutRunState:="") {
    FileGetShortcut, %LinkFile%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
}

/**
 * Gets the size of the file in different units
 *
 * @Parameters
 *    @Filename    - [string] filename
 *    @Unit        - [string] unit for filesize output
 *
 * @Return
 *    int
*/
fileGetSize(Filename:="", Units:="") {
    FileGetSize, out, %Filename%, %Units%
    return out
}

/**
 * Retrieves the datetime stamp of a file or folder
 *
 * @Parameters
 *    @Filename     - [string] filename
 *    @WhichTime    - [string] Which timestamp to retrieve:
 *                             M = Modification time (default if the parameter is omitted)
 *                             C = Creation time
 *                             A = Last access time
 *
 * @Return
 *    string
*/
fileGetTime(Filename:="", WhichTime:="") {
    FileGetTime, out, %Filename%, %WhichTime%
    return out
}

/**
 * Retrieves the version of a file
 *
 * @Parameters
 *    @Filename    - [string] filename
 *
 * @Return
 *    string
*/
fileGetVersion(Filename:="") {
    FileGetVersion, out, %Filename%
    return out
}

/**
 * Reads a file's contents into a variable
 *
 * @Parameters
 *    @Filename    - [string] name of the file to read, which is assumed to be in %A_WorkingDir% if an absolute path isn't specified
 *
 * @Return
 *    string
*/
fileRead(Filename) {
    FileRead, out, %Filename%
    return out
}

/**
 * Reads a specified line of the file
 *
 * @Parameters
 *    @Filename    - [string] filename
 *    @LineNum     - [int] line being read from
 *
 * @Return
 *    string
*/
fileReadLine(Filename, LineNum) {
    FileReadLine, out, %Filename%, %LineNum%
    return out
}

/**
 * Selects a file and saves the full path in variable
 *
 * @Parameters
 *    @Options      - [string] see Options at https://www.autohotkey.com/docs/commands/FileSelectFile.htm#Parameters
 *    @RootDir      - [string] see RootDir\Filename at https://www.autohotkey.com/docs/commands/FileSelectFile.htm#Parameters
 *    @Promt        - [string] Text displayed in the window to instruct the user what to do
 *    @Filter       - [string] Indicates which types of files are shown by the dialog (e.g. "*.csv")
 *
 * @Return
 *    string
*/
fileSelectFile(Options:="", RootDir:="", Prompt:="", Filter:="") {
    FileSelectFile, out, %Options%, %RootDir%, %Prompt%, %Filter%
    return out
}

/**
 * Displays a standard dialog that allows the user to select a folder
 *
 * @Parameters
 *    @StartingFolder   - [string] If blank or omitted, the dialog's initial selection will be the user's My Documents folder
 *    @Options          - [string] see Options at https://www.autohotkey.com/docs/commands/FileSelectFolder.htm#Parameters
 *    @Promt            - [string] Text displayed in the window to instruct the user what to do
 *
 * @Return
 *    string
*/
fileSelectFolder(StartingFolder:="", Options:="", Prompt:="") {
    FileSelectFolder, out, %StartingFolder%, %Options%, %Prompt%
    return out
}

/**
 * Returns the floor modulus of the int arguments.
 * The floor modulus is x - (Floor(x / y) * y), has the same sign as the divisor y
 * The difference in values between floorMod and the % operator is due to the difference 
 * between a "floor division" which returns the integer <<less than or equal to the quotient>> 
 * and the "/"" operator that returns the <<integer closest to zero>>.
 *
 * @Parameters
 *    @int1    - [int] dividend
 *    @int2    - [int] divisor
 *
 * @Return
 *    int
*/
floorMod(int1, int2) {
    return int1 - (Floor(int1 / int2) * int2)
}


/**
 * Formats time string into specified format
 *
 * @Parameters
 *    @YYYYMMDDHH24MISS    - [string] expects valid time string
 *    @Format              - [string] output format
 *
 * @Return
 *    string
*/
formatTime(YYYYMMDDHH24MISS:="", Format:="") {
    FormatTime, out, %YYYYMMDDHH24MISS%, %Format%
    return out
}

/**
 * Gets the state of given key
 *
 * @Parameters
 *    @WhichKey    - [string] name of key
 *    @Mode        - []
 *
 * @Return
 *    string
*/
getKeyState(WhichKey , Mode:="") {
    GetKeyState, out, %WhichKey%, %Mode%
    return out
}

/**
 * Gets the content or param of specified UI element
 *
 * @Parameters
 *    @Subcommand    - [string] sub-commands for GuiControlGet can be found here (optional)
 *                              https://www.autohotkey.com/docs/commands/GuiControlGet.htm#SubCommands
 *    @ControlID     - [object] hwndObject (saved during GUI creation inside the class)
 *    @Param4        - [string] depends on sub-commands for GuiControlGet (optional)
 *                              https://www.autohotkey.com/docs/commands/GuiControlGet.htm#SubCommands
 *
 * @Return
 *    depends on sub-commands for GuiControlGet
*/
guiControlGet(ControlID:="", Subcommand:="", Param4:="") {
    GuiControlGet, out, %Subcommand%, %ControlID%, %Param4%
    return out
}

/**
 * Searches for an image at given position
 *
 * @Parameters
 *    @OutputVarX       - [string] name of the variable in which to store the X coordinate
 *    @OutputVarY       - [string] name of the variable in which to store the Y coordinate
 *    @X1               - [int] X coordinate of the upper left corner of the rectangle to search, which can be expressions
 *    @Y1               - [int] Y coordinate of the upper left corner of the rectangle to search, which can be expressions
 *    @X2               - [int] X coordinate of the lower right corner of the rectangle to search, which can be expressions
 *    @Y2               - [int] Y coordinate of the lower right corner of the rectangle to search, which can be expressions
 *    @ImageFile        - [string] file name of an image, which is assumed to be in %A_WorkingDir% if an absolute path isn't specified
 *
 * @Return
 *    boolean
*/
imageSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ImageFile) {
    ImageSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
}

/**
 * Reads from keys and sections from an ini file. 
 *
 * @Parameters
 *    @Filename     - [string] filename
 *    @Section      - [string] name of the section to read from
 *    @Key          - [string] name of the key to read
 *    @Default      - [string] name of the default key
 *
 * @Return
 *    Return
*/
iniRead(Filename, Section, Key:="", Default:="") {
    IniRead, out, %Filename%, %Section%, %Key%, %Default%
    return out
}

/**
 * Writes to keys and sections of an ini file. 
 *
 * @Parameters
 *    @Filename     - [string] filename
 *    @Value        - [string] value of the key
 *    @Section      - [string] name of the section to read from
 *    @Key          - [string] name of the key to read
 *
 * @Return
 *    no return value
*/
iniWrite(Filename, Value, Section, Key:="") {
    IniWrite, %Value%, %Filename%, %Section%, %Key%
}

/**
 * Waits for the user to type a string
 *
 * @Parameters
 *    @Options      - [string] see Options at https://www.autohotkey.com/docs/commands/Input.htm#Parameters
 *    @EndKey       - [string] A list of zero or more keys, any one of which terminates the Input when pressed
 *    @MatchList    - [string] A comma-separated list of key phrases, any of which will cause the Input to be terminated
 *
 * @Return
 *    Return
*/
input(Options:="", EndKeys:="", MatchList:="") {
    Input, out, %Options%, %EndKeys%, %MatchList%
    return out
}

/**
 * Displays an input box to ask the user to enter a string.
 *
 * @Parameters
 *    @Title    - [string] title of the input box. If blank or omitted, it defaults to the name of the script
 *    @Prompt   - [string] text of the input box, which is usually a message to the user indicating what kind of input is expected
 *    @HIDE     - [string] If this parameter is the word HIDE, the user's input will be masked, which is useful for passwords
 *    @Width    - [int] If this parameter is blank or omitted, the starting width of the window will be 375
 *    @Height   - [int] If this parameter is blank or omitted, the starting height of the window will be 189
 *    @X        - [int] x coordinate of the window (optional)
 *    @Y        - [int] y coordinate of the window (optional)
 *    @Font     - [string] Not yet implemented (leave blank)
 *    @Timeout  - [int] timeout in seconds (optional)
 *    @Default  - [string] string that will appear in the InputBox's edit field when the dialog first appears
 *
 * @Return
 *    string, int, boolean
*/
inputBox(Title:="", Prompt:="", HIDE:="", Width:="", Height:="", X:="", Y:="", Font:="", Timeout:="", Default:="") {
    InputBox, out, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%, , %Timeout%, %Default%
    return out
}

/**
 * compares string to list of items
 * if item matches comparison, return false (is in list)
 * this compares also arrays and variadic parameters
 * this is valid 
 *
 * @Parameters
 *    @var           - [string][int] can be either int or string
 *    @list_items    - [string][object] list of items, either in an object or in a delimiter
 *                                      separated string without spaces; e.g "1,2,3"
 *    @delimiter     - [string] delimiter for the list
 *
 * @Return
 *    Return
*/
inList(ByRef var, list_items, delimiter:=","){
    if IsObject(list_items) {
        for each, item in list_items {
            if (item == var) {
                return true
            }
        }
        return false
    } else {
        return !!InStr(delimiter . list_items . delimiter, delimiter . var . delimiter)
    }
}

/**
 * Checks whether a variable's contents are numerically or alphabetically between two values
 * if all 1 or more values are strings they will be compared alphabetically
 * in case of 3 numbers, they will be compared numerically
 *
 * @Parameters
 *    @var          - [int][string] can be either int or string
 *    @LowerBound   - [int][string] can be either int or string
 *    @UpperBound   - [int][string] can be either int or string
 *
 * @Return
 *    boolean
*/
isBetween(ByRef var, LowerBound, UpperBound) {
    If (var >= LowerBound and var <= UpperBound)
        return true
}

/**
 * Checks whether a variable's contents are numeric, uppercase, etc.
 *
 * @Parameters
 *    @var      - [int][float][number][digit][xdigit][alpha][upper][lower][alnum][space][time]
 *    @type     - [string]
 *
 * @Return
 *    boolean
*/
isType(ByRef var, type) {
    if var is %type%
    {
        return true
    }
    return false
}

/**
 * joins parameters into string seperated by user defined seperator
 *
 * @Parameters
 *    @sep      - [string] expects any string input
 *    @params   - [string][array][object] accepts arrays, objects or several strings
 *
 * @Return
 *    string
*/
join(sep, params*) {
    for index,param in params {
        str .= sep . param
    }
    return SubStr(str, StrLen(sep)+1)
}

/**
 * closes process, in case we have hidden windows or need to remove a process
 *
 * @Parameters
 *    @pName    - [string] expects valid process name; e.g "iexplore.exe", "sublime_text.exe"
 *
 * @Return
 *    no return value
*/
killProcess(pName){
    for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process where Name='" . pName . "'"){
        Process, Close,% process.ProcessId
    }
}

/**
 * creates messages boxes that can be enabled or disabled, depending if unit tests are being done
 *
 * @Parameters
 *    args    - [string] expects arguments in this format
 *                       Options, Title, Text, Timeout
 *
 * @Return
 *    Return
*/
msgbox(message, Options:="", Title:="", Timeout:=""){
    MsgBox, % Options, % Title, % message, % Timeout
}

/**
 * Retrieves the current position of the mouse cursor, and optionally which window and control it is hovering over.
 *
 * @Parameters
 *    @OutputVarX           - [string] name of the variable in which to store the X coordinate
 *    @OutputVarY           - [string] name of the variable in which to store the Y coordinate
 *    @OutputVarWin         - [string] name of the variable in which to store the unique ID number 
 *                                     of the window under the mouse cursor
 *    @OutputVarControl     - [string] name of the variable in which to store the name (ClassNN) 
 *                                     of the control under the mouse cursor
 *    @Flag                 - [int] See flags at 
 *                                  https://www.autohotkey.com/docs/commands/MouseGetPos.htm#Parameters
 *
 * @Return
 *    no return value
*/
mouseGetPos(ByRef OutputVarX:="", ByRef OutputVarY:="", ByRef OutputVarWin:="", ByRef OutputVarControl:="", Flag:="2") {
    MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, %Flag%
}

/**
 * Retrieves the color of the pixel at the specified x,y coordinates.
 *
 * @Parameters
 *    @X        - [int] X coordinate of the pixel, which can be expressions
 *    @Y        - [int] Y coordinate of the pixel, which can be expressions
 *    @mode      - [string] see mode at https://www.autohotkey.com/docs/commands/PixelGetColor.htm#Parameters
 *
 * @Return
 *    hex value
 *
 * Remarks Coordinates are relative to the active window unless CoordMode was used to change that.
*/
pixelGetColor(X, Y, mode:="") {
    PixelGetColor, out, %X%, %Y%, %mode%
    return out
}

/**
 * Searches a region of the screen for a pixel of the specified color
 *
 * @Parameters
 *    @OutputVarX    - [string] name of the variable in which to store the X coordinate
 *    @OutputVarY    - [string] name of the variable in which to store the Y coordinate
 *    @X1            - [int] X coordinate of the upper left corner of the rectangle to search, which can be expressions
 *    @Y1            - [int] Y coordinate of the upper left corner of the rectangle to search, which can be expressions
 *    @X2            - [int] X coordinate of the lower right corner of the rectangle to search, which can be expressions
 *    @Y2            - [int] Y coordinate of the lower right corner of the rectangle to search, which can be expressions
 *    @ColorID       - [dec][hex] decimal or hexadecimal color ID to search for, in Blue-Green-Red (BGR) format, which can be an expression
 *    @Variation     - [int] number between 0 and 255 (inclusive) to indicate the allowed number of shades of variation
 *    @Mode          - [string] see mode at https://www.autohotkey.com/docs/commands/PixelSearch.htm#Parameters
 * 
 *
 * @Return
 *    boolean
*/
pixelSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ColorID, Variation:="", Mode:="") {
    PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Mode%
}

/**
 * Generates a pseudo-random number
 *
 * @Parameters
 *    @Min    - [int] lower boundary of number generate
 *    @Max    - [int] upper boundary of number generate
 *
 * @Return
 *    int
*/
random(Min:="", Max:="") {
    Random, out, %Min%, %Max%
    return out
}

/**
 * Reads a value from the registry
 *
 * @Parameters
 *    @RootKey       - [string] full name of the registry key 
 *                              must start with HKEY_LOCAL_MACHINE, HKEY_USERS, HKEY_CURRENT_USER, HKEY_CLASSES_ROOT, or HKEY_CURRENT_CONFIG 
 *                              (or the abbreviations for each of these, such as HKLM)
 *    @ValueName     - [string] name of the value to retrieve. If omitted, KeyName's default value will be retrieved
 *
 * @Return
 *    string
*/
regRead(RootKey, ValueName:="") {
    RegRead, out, %RootKey%, %ValueName%
    return out
}

/**
 * clears any existing tooltips from the screen
*/
RemoveToolTip() {
    ToolTip
}


/**
 * Runs an external program.
 *
 * @Parameters
 *    @Target       - [string] A document, URL, executable file (.exe, .com, .bat, etc.), shortcut (.lnk), or system verb to launch
 *    @WorkingDir   - [string] working directory for the launched item. Don't enclose the name in double quotes even if it contains spaces
 *    @Options      - [string] see Options at https://www.autohotkey.com/docs/commands/Run.htm#Parameters
 *
 * @Return
 *     no return value
*/
run(Target, WorkingDir:="", Options:="") {
    Run, %Target%, %WorkingDir%, %Options%, v
}

/**
 * Arranges a variable's contents in alphabetical, numerical, or random order (optionally removing duplicates).
 *
 * @Parameters
 *    @var          - [string][int] Arranges a variable's contents in alphabetical, numerical, 
 *                                  or random order (optionally removing duplicates).
 *    @Options      - [string] A string of zero or more of the following letters (in any order, with optional spaces in between)
 *                             C, CL, Dx, F MyFunction, N, Pn, R, Random, U, Z, \
 *                             see Options at https://www.autohotkey.com/docs/commands/Sort.htm#Options
 *
 * @Return
 *    no return value
*/
sort(Byref var, Options:="") {
    Sort var, %Options%
}


/**
 * Retrieves various settings from a sound device (master mute, master volume, etc.)
 *
 * @Parameters
 *    @ComponentType    - [string] has to be special parameter
 *                                 see https://www.autohotkey.com/docs/commands/SoundGet.htm#Parameters
 *    @ControlType      - [string] has to be special parameter
 *                                 see https://www.autohotkey.com/docs/commands/SoundGet.htm#Parameters
 *    @DeviceNumber     - [int] A number between 1 and the total number of supported devices. 
 *                              If this parameter is omitted, it defaults to 1
 *
 * @Return
 *    string
*/
soundGet(ComponentType:="", ControlType:="", DeviceNumber:="") {
    SoundGet, out, %ComponentType%, %ControlType%, %DeviceNumber%
    return out
}

/**
 * Retrieves the wave output volume for a sound device.
 *
 * @Parameters
 *    @DeviceNumber    - [int] A number between 1 and the total number of supported devices. 
 *                             If this parameter is omitted, it defaults to 1
 *
 * @Return
 *    int
*/
soundGetWaveVolume(DeviceNumber:="") {
    SoundGetWaveVolume, out, %DeviceNumber%
    return out
}

/**
 * Splits path into different parts
 *
 * @Parameters
 *    InputVar          - [string] Name of the variable containing the file name to be analyzed.
 *    OutFileName       - [string] Name of the variable in which to store the file name without its path. The file's extension is included.
 *    OutDir            - [string] Name of the variable in which to store the directory of the file, including drive letter or share name (if present). 
 *                                 The final backslash is not included even if the file is located in a drive's root directory.
 *    OutExtension      - [string] Name of the variable in which to store the file's extension (e.g. TXT, DOC, or EXE). The dot is not included.
 *    OutNameNoExt      - [string] Name of the variable in which to store the file name without its path, dot and extension.
 *    OutDrive          - [string] Name of the variable in which to store the drive letter or server name of the file
 *
 * @Return
 *    no return value
*/
splitPath(ByRef InputVar, ByRef OutFileName:="", ByRef OutDir:="", ByRef OutExtension:="", ByRef OutNameNoExt:="", ByRef OutDrive:="") {
    SplitPath, InputVar, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
}
/**
 * Retrieves screen resolution, multi-monitor info, 
 * dimensions of system objects, and other system properties
 *
 * @Parameters
 *    @Subcommand    - [string] https://www.autohotkey.com/docs/commands/SysGet.htm#SubCommands
 *    @Param3        - [string] https://www.autohotkey.com/docs/commands/SysGet.htm#SubCommands
 *
 * @Return
 *    string or object
 *
 * @Remarks
 *     SubCommand and Param3 parameters are dependent upon each other
*/
sysGet(Subcommand, Param3:="") {
    SysGet, out, %Subcommand%, %Param3%
    return out
}

/**
 * Performs miscellaneous math functions, bitwise operations, 
 * and tasks such as ASCII/Unicode conversion
 *
 * @Parameters
 *    @SubCommand    - [string] https://www.autohotkey.com/docs/commands/Transform.htm#SubCommands
 *    @Value1        - [string] https://www.autohotkey.com/docs/commands/Transform.htm#SubCommands
 *    @Value2        - [string] https://www.autohotkey.com/docs/commands/Transform.htm#SubCommands
 *
 * @Return
 *    string or int
 *
 * @Remarks
 *     SubCommand, Value1 and Value2 parameters are dependent upon each other
*/
transform(Cmd, Value1, Value2:="") {
    Transform, out, %Cmd%, %Value1%, %Value2%
    return out
}

/**
 * displays tooltip with given string and automatically removes it after 1 second
 *
 * @Parameters
 *    @string    - [string] (optional)
 *
 * @Return
 *    no return value
 *
 * @Remarks
 *     can be called without parameter; autohotkey calls an empty tooltip to clear existing ones
*/
tooltip(string:="", timeout:=1000) {
    ToolTip, % string
    if (timeout > 0) {
        RemoveToolTip := Func("RemoveToolTip").Bind()
        SetTimer %RemoveToolTip%, % -timeout
    }
}

urlDownloadToFile(path_to_file, download_directory, file_name) {
    if (!FileExist(download_directory)) {
        fileCreateDir(download_directory)
    } 
    UrlDownloadToFile, %path_to_file%, %download_directory%\%file_name%
}