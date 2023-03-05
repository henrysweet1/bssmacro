;making variables for timers global



if (A_TickCount < 30mtimer || A_TickCount < 1htimer || A_TickCount < 2htimer || A_TickCount < 4htimer){ ;fixes timers if they're broken
	ErrorLog("A_Tickcount is smaller than previously saved time because the pc was rebooted, the timers have been reset")
	Tooltip,Current time is smaller than saved time / timers have been reset
	resettimers()
	sleep 4000
	Tooltip,
}

resettimers(){ ;resets all the timers hahahhahahha
	IniWrite,-999999999999,configs/previous.ini,extras,30mtimer
	IniWrite,-999999999999,configs/previous.ini,extras,1htimer
	IniWrite,-999999999999,configs/previous.ini,extras,2htimer
	iniWrite,-999999999999,configs/previous.ini,extras,4htimer
	IniWrite,-999999999999,configs/previous.ini,advanced,srtimer
	IniWrite,-999999999999,configs/previous.ini,advanced,22htimer
	IniWrite,-999999999999,configs/previous.ini,advanced,24htimer
	
	IniWrite,-999999999999,configs/previous.ini,beesmas,feasttimer
	IniWrite,-999999999999,configs/previous.ini,beesmas,gingertimer
	IniWrite,-999999999999,configs/previous.ini,beesmas,candletimer
	IniWrite,-999999999999,configs/previous.ini,beesmas,samovartimer
	IniWrite,-999999999999,configs/previous.ini,beesmas,lidtimer
	IniWrite,-999999999999,configs/previous.ini,beesmas,cogtimer
	
	k := 2
	while (k < 8){
		IniWrite,-999999999999,configs/previous.ini,hotbardata,hot%k%timer
		k++
	}
}

beesmastimerchecks(){ ;separate function to check all the timers that have anything to do with beesmas
	IniRead,samovart,configs/previous.ini,beesmas,samovar
	IniRead,candlet,configs/previous.ini,beesmas,candles
	IniRead,feastt,configs/previous.ini,beesmas,feast
	IniRead,gingert,configs/previous.ini,beesmas,ginger
	IniRead,lidartt,configs/previous.ini,beesmas,lidart
	IniRead,cogt,configs/previous.ini,beesmas,cog
	
	if (A_Tickcount - feasttimer  > 5400000){
		IniWrite,%A_TickCount%,configs/previous.ini,beesmas,feasttimer
		if (feastt){
			feast()
			safetycheck()
		}
	}
	if (A_TickCount - gingertimer > 7200000){
		IniWrite,%A_Tickcount%,configs/previous.ini,beesmas,gingertimer
		if (gingert){
			gingerhouse()
			safetycheck()
		}
	}
	if (A_Tickcount - candletimer > 14400000){
		IniWrite,%A_Tickcount%,configs/previous.ini,beesmas,candletimer
		if (candlet){
			candles()
			safetycheck()
		}
	}
	if (A_Tickcount - samovartimer > 21600000){
		IniWrite,%A_Tickcount%,configs/previous.ini,beesmas,samovartimer
		if (samovart){
			samovar()
			safetycheck()
		}
	}
	if (A_Tickcount - lidtimer > 28800000){
		IniWrite,%A_Tickcount%,configs/previous.ini,beesmas,lidtimer
		if (lidartt){
			lidart()
			safetycheck()
		}
	}
	if (A_TickCount - cogtimer > 79200000){
		IniWrite,%A_Tickcount%,configs/previous.ini,beesmas,cogtimer
		if (cogt){
			cogpass()
			safetycheck()
		}
	}
}

timerchecks(){ ;function that checks all the timers and runs them
	global allowrejoinconv := false
	savedata()
	safetycheck()
	if(reconnected = true){
		global reconnected := false
	}
	servrestartcheck()
	lbsscheck()
	beesmastimerchecks()
	if (A_min > 15){
		global wenttomondo := false
	}
	if (mondokilldata != "No Kill" && A_Min > 01 && A_Min < 13 && wenttomondo = false){
		global resetpine := true
		mondo()
		global wenttomondo := true
	}
	safetycheck()
	if (A_TickCount - 30mtimer > 1860000){
		global resetpine := true
		EvenTlog("Ran the 30 minute timer checks")
		IniWrite,%A_TickCount%,configs/previous.ini,extras,30mtimer
		safetycheck()
		if (whenplayanttoggle = true && whenplay = "30 min"){
			buyplayant()
		}
		safetycheck()
		checkplants("30 min")
	}
	if (A_TickCount - 1htimer > 3612000){
		global resetpine := true
		EvenTlog("Ran the 1 hour timer checks")
		IniWrite,%A_TickCount%,configs/previous.ini,extras,1htimer
		safetycheck()
		if (whenplayanttoggle = true && whenplay = "1 hour"){
			buyplayant()
		}
		checkplants("1 hour")
		
		if (wealthclock){
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			WealthClock()
			IniRead,stockingt,configs/previous.ini,beesmas,stockings
			if (stockingt){
				stocking()
			}
			safetycheck()
		}
		if (blueboosters){
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			bluebooster()
			safetycheck()
		}
		if (redboosters){
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			redbooster()
			safetycheck()
		}
		if (mountainboosterss){
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			mountainbooster()
			safetycheck()
		}
		global resetpine := true
	}
	if (A_TickCount - 2htimer > 7224000){
		global resetpine := true
		EvenTlog("Ran the 2 hour timer checks")
		IniWrite,%A_TickCount%,configs/previous.ini,extras,2htimer
		safetycheck()
		if (whenplayanttoggle = true && whenplay = "2 hours"){
			buyplayant()
		}
		
		checkplants("2 hours")
		
		if (antpasss){
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			ant()
			if(pantstatus){
				GoDoAnt()
			}
			safetycheck()
		}
		global resetpine := true
	}
	if (A_TickCount - 4htimer > 14448000){
		global resetpine := true
		global screenshottedboard := false
		EventLog("Ran the 4 hour timer checks")
		iniWrite,%A_TickCount%,configs/previous.ini,extras,4htimer
		safetycheck()
		if (whenplayanttoggle = true && whenplay = "4 hours"){
			buyplayant()
		}
		
		checkplants("4 hours")
		
		
		if (cocooption){
			EventLog("Triggered Coconut dispensor path")
			cocodisp()
			safetycheck()
		}
		global resetpine := true
	}
	if (A_TickCount - 22htimer > 79200000){
		global resetpine := true
		safetycheck()
		Eventlog("Ran 22 hour timer checks")
		IniWrite,%A_TickCount%,configs/previous.ini,advanced,22htimer
		if (dogluedisp){
			gluedisp()
			safetycheck()
		}
		global resetpine := true
	}
	if (A_TickCount - 24htimer > 88200000){
		global resetpine := true
		safetycheck()
		Eventlog("Ran 24 hour timer checks")
		IniWrite,%A_TickCount%,configs/previous.ini,advanced,24htimer
		if (dokb){
			kingbeetle()
			safetycheck()
		}if (dotb){
			tunnelbear()
			safetycheck()
		}
	}
	global allowrejoinconv := true
}

servrestartcheck(){ ;checks if it's time to restart the server
	if (tier = 1 || tier = 2){
		GuiControlGet,shutdownserv
		if (shutdownserv){
			IniRead,srtimer,configs/previous.ini,advanced,srtimer
			GuiControlGet,srtime
			if (A_TickCount - srtimer > srtime*60000){
				IniWrite,%A_TickCount%,configs/previous.ini,advanced,srtimer
				ServerReboot()
			}
		}
	}
}

lbsscheck(){ ;checks if it's time to reset the leaderboard
	if (tier = 1 || tier = 2){
		GuiControlGet,ssboard
		GuiControlGet,lbsshour
		GuiControlGet,lbssmin
		if (ssboard && screenshottedboard = false){
			var := lbsshour . lbssmin
			var2 := A_Hour . A_min
			if (var = var2){
				screenboards()
				global screenshottedboard := true
				return
			}loop 9{
				lbssmin++
				var := lbsshour . lbssmin
				if (var = var2){
					screenboards()
					global screenshottedboard := true
					return
				}
			}
			
			
		}
	}
}
