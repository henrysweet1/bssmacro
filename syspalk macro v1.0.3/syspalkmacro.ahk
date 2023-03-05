;please don't steal my code
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
	if(farmfield1 = "None" && farmfield2 = "None" && farmfield3 = "None" && farmfield4 = "None"){
		goto,start
	}
	if not(farmfield1 = "None"){
		if (farmfield1 = "bugrun&polar"){
			bugrun()
		}
		GOFarm(farmfield1,false)
	}
	timerchecks()
	if not(farmfield2 = "None"){
		if (farmfield2 = "bugrun&polar"){
			bugrun()
		}else{
			GOFarm(farmfield2,false)
		}
	}
	timerchecks()
	if not(farmfield3 = "None"){
		if (farmfield3 = "bugrun&polar"){
			bugrun()
		}
		GOFarm(farmfield3,false)
	}
	timerchecks()
	if not(farmfield4 = "None"){
		if (farmfield4 = "bugrun&polar"){
			bugrun()
		}else{
			GOFarm(farmfield4,false)
		}
	}
}