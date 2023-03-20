if (0){ ;makes sure that it doesn't run when file is being included, without this the main script would never run because it would be stuck on a return here.
	speedsafety:
	GuiControlGet,haststatus
	if(haststatus > 50){
		haststatus := 50
	}
	if(haststatus < 10){
		haststatus := 10
	}
	GuiControl,,haststatus,%haststatus%
	return
	hook:
	GuiControlget,hookerror
	GuiControlget,hookevent
	GuiControlget,hookballoon
	IniWrite,%hookerror%,configs/privlinks.ini,webhooks,errors
	IniWrite,%hookevent%,configs/privlinks.ini,webhooks,events
	IniWrite,%hookballoon%,configs/privlinks.ini,webhooks,balloon
	return
	ButtonResetConfigFile:
	Tooltip,Successfully reset configs!
	sleep 1000
	Tooltip,
	Resetconfigfile()
	return
	ButtonJoinDiscord:
	run,https://discord.gg/t572FnTqfs
	return
	numberonfieldsafety:
	GuiControlGet,maxtimespentonfield
	if(maxtimespentonfield > 30){
		maxtimespentonfield := 30
	}
	if(maxtimespentonfield < 1){
		maxtimespentonfield := 1
	}
	GuiControl,,maxtimespentonfield,%maxtimespentonfield%
	return
	privlink1:
	GuiControlGet,privlink1
	IniWrite,%privlink1%,configs/privlinks.ini,xd,l1
	return
	privlink2:
	GuiControlGet,privlink2
	IniWrite,%privlink2%,configs/privlinks.ini,xd,l2
	return
	ButtonResetTimers:
	resettimers()
	Tooltip,Successfully reset timers!
	sleep 1500
	Tooltip,
	return
	GuiClose:
	EventLog("Closed Gui")
	savedata()
	sleep 250
	ExitApp
	return
	ButtonResetPlantSettings:
	Eventlog("Reset the plant settings")
	savedata()
	resetplantsettings()
	Reload()
	return
	ButtonBeesmasUI:
	loadbeesmasui()
	return
	ButtonPlantcycles:
	loadplantui()
	return
	Buttoncustomizefarming:
	loadfarmui()
	return
	ButtonResetCycleData:
	IniWrite,0,configs/previous.ini,plantdata,cycle1
	IniWrite,0,configs/previous.ini,plantdata,cycle2
	IniWrite,0,configs/previous.ini,plantdata,cycle3
	IniWrite,0,configs/previous.ini,plantdata,prev1
	IniWrite,0,configs/previous.ini,plantdata,prev2
	IniWrite,0,configs/previous.ini,plantdata,prev3
	Tooltip,Successfully reset cycle data!
	sleep 1500
	Tooltip,
	return
	activateroblox:
	WinActivate, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
	if (convstatus != "None" && (A_TickCount - lastconv)/1000 > 1800){
		balloonwarning()
	}
	return
	F3::Pause
	EventLog("Paused")
	ButtonReload(F2):
	F2::
	EventLog("Reloaded")
	if (guiloaded = true){
		Send {Click Left Up}
		Send {Space Up}
		walkhold("f","Up")
		walkhold("b","Up")
		walkhold("l","Up")
		walkhold("r","Up")
		savedata()
		Reload()
	}else{
		msgbox,gui not loaded
	}
	return
	updatekeyboard:
	GuiControlGet,keyboard
	IniWrite,%keyboard%,configs/previous.ini,gui,keyboard
	return
	ButtonLoadblue5nectarpreset:
	IniWrite,Pine Tree,configs/previous.ini,plantdata,plant1field1
	IniWrite,Pineapple,configs/previous.ini,plantdata,plant1field2
	IniWrite,Coconut,configs/previous.ini,plantdata,plant1field3
	IniWrite,Sunflower,configs/previous.ini,plantdata,plant1field4
	IniWrite,Spider,configs/previous.ini,plantdata,plant2field1
	IniWrite,Strawberry,configs/previous.ini,plantdata,plant2field2
	IniWrite,Rose,configs/previous.ini,plantdata,plant2field3
	IniWrite,Mushroom,configs/previous.ini,plantdata,plant2field4
	IniWrite,Blue Flower,configs/previous.ini,plantdata,plant3field1
	IniWrite,Mountain,configs/previous.ini,plantdata,plant3field2
	IniWrite,Pepper,configs/previous.ini,plantdata,plant3field3
	IniWrite,Cactus,configs/previous.ini,plantdata,plant3field4
	
	IniWrite,7,configs/previous.ini,plantdata,plant1hotkey1
	IniWrite,7,configs/previous.ini,plantdata,plant1hotkey2
	IniWrite,7,configs/previous.ini,plantdata,plant1hotkey3
	IniWrite,7,configs/previous.ini,plantdata,plant1hotkey4
	IniWrite,6,configs/previous.ini,plantdata,plant2hotkey1
	IniWrite,6,configs/previous.ini,plantdata,plant2hotkey2
	IniWrite,6,configs/previous.ini,plantdata,plant2hotkey3
	IniWrite,6,configs/previous.ini,plantdata,plant2hotkey4
	IniWrite,4,configs/previous.ini,plantdata,plant3hotkey1
	IniWrite,5,configs/previous.ini,plantdata,plant3hotkey2
	IniWrite,5,configs/previous.ini,plantdata,plant3hotkey3
	IniWrite,5,configs/previous.ini,plantdata,plant3hotkey4
	return
}