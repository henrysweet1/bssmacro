;please don't steal my code
Tooltip,Checking for updates...
#include Macro Parts\Version checker.ahk
Tooltip,Loading...
#include Macro Parts\Data Handler.ahk
#include Macro Parts\Functions.ahk
#include Macro Parts\Timers.ahk
#include Macro Parts\Labels.ahk
#include Macro Parts\Patterns.ahk
#include Macro Parts\Paths.ahk
#include Macro Parts\GUI.ahk

;gui creation
loadmainui()
IniRead,firstlaunch,configs/previous.ini,gui,firstlaunch
if (firstlaunch){
	popup(500,180,"New in this version","1. Reconnect will now close chrome every single time it attempts to reconnect.`n2. Changed maximum time on field to 60 minutes instead of 30.`n3. Changed clicking position to open the inventory so the glue dispenser now works when you're macroing with/without fullscreen enabled [the same goes for toggling the cub buddy for the shrine]`n4. Changed shrine image to fix possible issues.`n5. Made the process of going through the shrine donation options a little bit faster.")
	IniWrite,0,configs/previous.ini,gui,firstlaunch
}

return

;start
ButtonStart(F1):
F1::
Tooltip,Starting...
EventLog("Started") ;log "Started" to the log
savedata() ;save all the data from the gui in the ini file
errorcheck() ;check if there are any input errors | for example an impossible planter combination
SetTimer,activateroblox,60000 ;set a timer to automatically activate the roblox window once per minute
Gui, -AlwaysOnTop
WinActivate, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe ;activate roblox window
while(1){
	start:
	savedata() ;updates all the variables and saves the whole gui
	sleep 250
	Tooltip,
	safetycheck()
	if(reconnected = true){
		global reconnected := false
	}
	timerchecks()
	while (A_Index < 5){
		if not (farmfield%A_Index% = "None"){
			if (farmfield%A_Index% = "bugrun&polar"){
				bugrun()
			}
			GOFarm(farmfield%A_Index%,false)
		}
		timerchecks()
	}
}