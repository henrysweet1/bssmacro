GoFarm(var1,var2){ ;function for farming.
	gofarmstart:
	timerchecks()
	global convert := 0
	savedata()
	GoField(var1,var2)
	if (var1 = "Blue Flower"){
		camrotate(4,"r")
		walk(750,"l")
		walk(750,"f")
	}
	if (tier = 1){
		global resetpine := false
	}
	IniRead,turnangle,configs/previous.ini,advanced,turnangle
	IniRead,dirtomovedata,configs/previous.ini,advanced,dirtomovedata
	IniRead,moveawayms,configs/previous.ini,advanced,moveawayms
	IniRead,movedata,configs/previous.ini,advanced,movedata
	IniRead,turncam,configs/previous.ini,advanced,turncam
	if (tier = 1 || tier = 2 || tier = 3){
		if (movedata){
			if (dirtomovedata = "None"){
			}else if (dirtomovedata = "N"){
				walk(moveawayms,"f")
			}else if (dirtomovedata = "E"){
				walk(moveawayms,"r")
			}else if (dirtomovedata = "S"){
				walk(moveawayms,"b")
			}else if (dirtomovedata = "W"){
				walk(moveawayms,"l")
			}else if (dirtomovedata = "NE"){
				walkhold("f","Down")
				walkhold("r","Down")
				sleep %moveawayms%
				walkhold("f","Up")
				walkhold("r","Up")
			}else if (dirtomovedata = "SE"){
				walkhold("b","Down")
				walkhold("r","Down")
				sleep %moveawayms%
				walkhold("b","Up")
				walkhold("r","Up")
			}else if (dirtomovedata = "SW"){
				walkhold("b","Down")
				walkhold("l","Down")
				sleep %moveawayms%
				walkhold("b","Up")
				walkhold("l","Up")
			}else if (dirtomovedata = "NW"){
				walkhold("f","Down")
				walkhold("l","Down")
				sleep %moveawayms%
				walkhold("f","Up")
				walkhold("l","Up")
			}
		}
	}
	breaktimer := A_TickCount
	maxfieldtime := maxtimespentonfield * 60000
	if (jumpstatus){
		Send {Space Down}
		sleep 9000
		Send {Space Up}
	}
	sleep 1000
	Send ooooooo
	if (tier = 1 || tier = 2 || tier = 3){
		if (turncam){
			camrotate(turnangle/45,"r")
		}
	}
	placesprinkler()
	checkbufftimer()
	
	if (killvic){
		if (var1 = "Pineapple"){
			Send iii
			sleep 100
		}
		if (var1 = "Spider"){
			camrotate(4,"r")
			Send oooooo
			sleep 100
		}
		if (var1 = "Strawberry"){
			camrotate(2,"l")
			Send oooooooo
			sleep 100
		}
		if (var1 = "Mushroom"){
			camrotate(2,"r")
			Send iiiiiiii
			sleep 100
		}
		if (var1 = "Spider"){
			if (viccheck(true)[1] = true){
				return
			}
		}else{
			if (viccheck(false)[1] = true){
				return
			}
		}
		if (var1 = "Strawberry"){
			camrotate(2,"r")
		}
		if (var1 = "Spider"){
			camrotate(4,"r")
		}
		if (var1 = "Mushroom"){
			camrotate(2,"l")
		}
		if (var1 = "Pineapple"){
			Send oooo
			sleep 100
		}
	}
	
	while(1){
		loop 3{
			if (var1 = "Pine Tree"){
				var77 := true
			}
			patern(fieldpaterns,fieldpaternsizes,var77)
			Send oooooooo
			if (sprinktoggle){
				if not (fieldpaterns = "None"){
					movetosat(10)
				}
			}
			if (killvic){
				if (var1 = "Pineapple"){
					Send iii
					sleep 100
				}
				if (var1 = "Spider"){
					camrotate(4,"r")
					Send oooooo
					sleep 100
				}
				if (var1 = "Strawberry"){
					camrotate(2,"l")
					Send oooooooo
					sleep 100
				}
				if (var1 = "Mushroom"){
					camrotate(2,"r")
					Send iiiiiiii
					sleep 100
				}
				if (var1 = "Spider"){
					if (viccheck(true)[1] = true){
						return
					}
				}else{
					if (viccheck(false)[1] = true){
						return
					}
				}
				if (var1 = "Strawberry"){
					camrotate(2,"r")
				}
				if (var1 = "Spider"){
					camrotate(4,"r")
				}
				if (var1 = "Mushroom"){
					camrotate(2,"l")
				}
				if (var1 = "Pineapple"){
					Send oooo
				}
			}
			if (A_TickCount - breaktimer > maxfieldtime){
				if (tier = 1){
					if (pineconvhive){
						pinewalktohive()
						goto,gofarmstart
					}else{
						return
					}
				}else{
					return
				}
			}
			dontreset:
			bagcheck()
			if (fullbag){
				global fullbag := false
				if (tier = 1){
					if (pineconvhive){
						pinewalktohive()
						goto,gofarmstart
					}else{
						return
					}
				}else{
					return
				}
			}
		}
		savedata()
		safetycheck()
		checkbufftimer()
		if(reconnected = true){
			global reconnected := false
			return
		}
	}
}

movetosat(var){ ;moves your character to the saturator.
	WinGetPos , windowX, windowY, windowWidth, windowHeight, Roblox
	winUp := windowHeight / 2.14
	winDown := windowHeight / 1.88
	winLeft := windowWidth / 2.14
	winRight := windowWidth /1.88
	If (SpecificPixelSearchFunction("0xFFD801",5,0,0,Winleft,A_ScreenHeight)[1] = 0){
		walk(100,"l")
		loop %var%{
			If (SpecificPixelSearchFunction("0xFFD801",5,0,0,Winleft,A_ScreenHeight)[1] = 0){
				walk(100,"l")
			}else{
				break
			}
		}
	}else if (SpecificPixelSearchFunction("0xFFD801",5,A_ScreenWidth,0,WinRight,A_ScreenHeight)[1] = 0){
		walk(100,"r")
		loop %var%{
			if (SpecificPixelSearchFunction("0xFFD801",5,A_ScreenWidth,0,WinRight,A_ScreenHeight)[1] = 0){
				walk(100,"r")
			}else{
				break
			}
		}
	}if (SpecificPixelSearchFunction("0xFFD801",5,0,0,A_ScreenWidth,WinUp)[1] = 0){
		walk(100,"f")
		loop %var%{
			if (SpecificPixelSearchFunction("0xFFD801",5,0,0,A_ScreenWidth,WinUp)[1] = 0){
				walk(100,"f")
			}else{
				break
			}
		}
	}else if (SpecificPixelSearchFunction("0xFFD801",5,0,A_ScreenHeight,A_ScreenWidth,winDown)[1] = 0){
		walk(100,"b")
		loop %var%{
			if (SpecificPixelSearchFunction("0xFFD801",5,0,A_ScreenHeight,A_ScreenWidth,winDown)[1] = 0){
				walk(100,"b")
			}else{
				break
			}
		}
	}
}

SendHotbar(var){ ;sends key to the hotbar.
	savedata()
	if(keyboardtype = "azerty"){
		if(var = 2){
			Send é
		}else if(var = 3){
			Send "
		}else if(var = 4){
			Send '
		}else if(var = 5){
			Send (
		}else if(var = 6){
			Send §
		}else if(var = 7){
			Send è
		}
	}
	else{
		Send %var%
	}
}

walk(time,dir){ ;makes the character do walking and stuff like that.
	distance := (time/haststatus)*28
	if (dir = "f"){
		if (keyboardtype = "azerty"){
			Send {z down}
			sleep %distance%
			Send {z up}
			Send {z up}
		}else{
			Send {w down}
			sleep %distance%
			Send {w up}
			Send {w up}
		}
	}else if (dir = "l"){
		if (keyboardtype = "azerty"){
			Send {q down}
			sleep %distance%
			Send {q up}
			Send {q up}
		}else{
			Send {a down}
			sleep %distance%
			Send {a up}
			Send {a up}
		}
	}else if (dir = "b"){
		Send {s down}
		sleep %distance%
		Send {s up}
		Send {s up}
	}else if (dir = "r"){
		Send {d down}
		sleep %distance%
		Send {d up}
		Send {d up}
	}
}

walkhold(dir,setting){ ;basically just the same as keydown but without a keyup after.
	if (dir = "f"){
		if (keyboardtype = "azerty"){
			Send {z %setting%}
		}else{
			Send {w %setting%}
		}
	}else if (dir = "l"){
		if (keyboardtype = "azerty"){
			Send {q %setting%}
		}else{
			Send {a %setting%}
		}
	}else if (dir = "b"){
		Send {s %setting%}
	}else if (dir = "r"){
		Send {d %setting%}
	}
}

SendSpace(){ ;makes the character jump.
	Send {space down}
	sleep 100
	Send {space up}
} 

walktocannon(){ ;makes the character walk to the cannon.
	attempts := 0
	cannonstart:
	if (attempts != 0){
		Reset()
	}
	attempts++
	savedata()
	sleep 100
	walk(1000,"f") 
	send {d down}
	sleep 6500
	sendSpace()
	sleep 400
	send {d up}
	WinGetPos , windowX, windowY, windowWidth, windowY, Roblox
	WindowY := windowY/3
	btimer := A_Tickcount
	loop{
		ImageSearch,foundx,foundy,0,0,A_ScreenWidth,windowY,*10 Macro Parts/images/e.png 
		if (errorlevel = 0){
			break
		}else{
			walk(50,"r")
		}
		if (A_Tickcount - btimer > 5000){
			if (attempts > 2){
				ErrorLog("Reconnected (Cause : E button for cannon wasn't detected after too many tries)")
				Reconnect()
				if (tier = 1){
					GuiControlGet,pineconvhive
					if (pineconvhive){
						Reset()
					}
				}
				global reconnectedcannon := true
				return
			}else{
				goto,cannonstart
			}
		}
	}
} 

Reconnect(){ ;this code is disgusting but it works and I don't want to fix it.
	savedata()
	while (1){
		attempt := 1
		retry:
		WinClose, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
		WinClose, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
		IniRead,plink1,configs/privlinks.ini,xd,l1
		IniRead,plink2,configs/privlinks.ini,xd,l2
		sleep 1000
		if (plink1 && serverjoinstatus){
			run, %plink1%
			attempt := 2
		}else if (plink1 && attempt = 1){
			run, %plink1%
			attempt := 2
		}else if (plink2 && serverjoinstatus != true && attempt = 2){
			run, %plink2%
			attempt := 3
		}else if (serverjoinstatus != true){
			run, https://www.roblox.com/games/2000343487?privateServerLinkCode=67181684702561561812873405717919
			if (plink1){
				attempt := 1
			}else{
				attempt := 2
			}
		}
		gloobgloobtime := A_TickCount
		while (1){
			WinActivate, Roblox ahk_class MAINDIALOG ahk_exe RobloxPlayerLauncher.exe
			IfWinActive, Roblox ahk_class MAINDIALOG ahk_exe RobloxPlayerLauncher.exe
			{
				Break
			}
			WinActivate, Roblox ahk_class MAINDIALOG ahk_exe RobloxPlayerLauncher.exe
			if (A_TickCount - gloobgloobtime > 15000){
				WinClose, ahk_exe chrome.exe
				Send w
				SendInput {Enter}
				goto,retry
			}
			
		}
		looptime := A_TickCount
		while(1){ ;search for the loading screen if loading screen found wait for loading screen to go away and then claim the hive, if the loading screen is there for longer than 60 seconds something must have gone wrong and it will exit the loop
			if (SearchFunction("LoadingScreen.png",20)[1] = 0){
				breaktimerr := A_TickCount
				while (1){
					if (SearchFunction("LoadingScreen.png",20)[1] = 1){
						goto, claimhive
					}
					if (A_TickCount - breaktimerr > 90000){
						ErrorLog("[RECONNECT] LoadingScreen Detected For 90 Seconds, will retry")
						break
					}
				}
			}
			if (A_TickCount - looptime > 120000){ ;if it has been in the infinite while loop for more than 120 seconds something must have gone wrong so get out of the loop
				Errorlog("[RECONNCT] Loadingscreen hasn't been detected after 3 minutes, will retry")
				goto,retry
			}
		}
		WinClose, ahk_exe chrome.exe
		SendInput {Enter}
	}
	
	
	
	claimhive:
	SendInput {Enter}
	global previousreconnect := A_TickCount
	WinClose, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	sleep 5000
	mouseMove, 100, 100,
	
	if (rejoinclaim){
		walk(8000,"f")
		walk(6000,"r")
		walk(650,"b")
		walkhold("l","Down")
		loopbreak := A_TickCount
		while (1){
			Send e
			if (A_TickCount - loopbreak > 8000){
				break
			}
		}
		walkhold("l","Up")
	}
} 

camrotate(amount,dir){ ;just rotates the damn camera
	if (dir = "l"){
		if (keyboardtype = "azerty"){
			dir := ";"
		}else if (keyboardtype = "qwertz"){
			dir := "."
		}else if (keyboardtype = "qwerty"){
			dir := ","
		}
	}else{
		if (keyboardtype = "azerty"){
			dir := ":"
		}else if (keyboardtype = "qwertz"){
			dir := ","
		}else if (keyboardtype = "qwerty"){
			dir := "."
		}
	}loop %amount%{
		Send %dir%
	}
} 

EventLog(Event){ ;saves what it does and when it does it in a text file for debugging
	FormatTime,Time, hh:mm:ss
	FileAppend,%Time% /// %Event% `n,Macro Parts\logs\EventLog.txt
	try{
		IniRead,url,configs/privlinks.ini,webhooks,events
		postdata=
		(
		{
		"content": "[EVENT] %Event%"
		}
		)
		WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		WebRequest.Open("POST", url, false)
		WebRequest.SetRequestHeader("Content-Type", "application/json")
		WebRequest.Send(postdata) 
	}
}

ErrorLog(ErrorMessage){ ;same thing as eventlog but this time it logs errors in a seperate file xd
	FormatTime,Time, hh:mm:ss
	FileAppend,%Time% /// %ErrorMessage% `n,Macro Parts\logs\ErrorLog.txt
	try{
		IniRead,url,configs/privlinks.ini,webhooks,errors
		postdata=
		(
		{
		"content": "[ERROR] %ErrorMessage%"
		}
		)
		WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		WebRequest.Open("POST", url, false)
		WebRequest.SetRequestHeader("Content-Type", "application/json")
		WebRequest.Send(postdata) 
	}
	
} 

PlantAction(option,plantnr,lootiffull){ ;here is where the cool plantaction happends yes i know it sounds cooler than it actually is but look
	savedata()
	if (option = "take"){ ;so for taking it actually sucks because you have to do all these safety things so it doesn't mess itself up
		sleep 500
		Send e
		loopbreak := A_TickCount
		while (1){ ;when you harvest it searches for the harvest ui and then just moves your mouse to the yes button and clicks it to harvest it, will automatically exit the loop after 15 seconds since something must have gone wrong if it takes that long to find the ui
			if (SearchFunction("Harvest_Planter.png",20)[1] = 0){
				global detectedharvestui := true
				breaktimer := A_TickCount
				while (1){
					if (lootiffull = true){
						if (SearchFunction("no.png",20)[1] = 0){
							sleep 100
							mouseMove, SearchFunction("no.png",20)[2], SearchFunction("no.png",20)[3]
							sleep 500
							Send {Click Left}
							sleep 1000
							return
						}
					}
					if (SearchFunction("Yes.png",20)[1] = 0){
						Sleep 100
						mouseMove, SearchFunction("Yes.png",20)[2], SearchFunction("Yes.png",20)[3]
						sleep 500
						Send {Click Left}
						if (lootplantstatus){
							lootplantpath()
						}
						sleep 1000
						return
					}
					if (A_TickCount - breaktimer > 5000){
						ErrorLog("Failed To Detect Yes.png")
						break
					}
				}
			}
			if (A_TickCount - loopbreak > 5000){
				global detectedharvestui := false
				if (lootiffull = true){
					lootplantpath()
					EventLog("Looted 100% grown plant")
					return
				}
				ErrorLog("Failed To Detect Harvest UI")
				break
			}
		}
		sleep 1000
		return
	}
	if (option = "place"){
		SendHotbar(plantnr)
		sleep 1000
		return
	}
}

Reset(){ ;this will make your character commit suicide and also has some crapy anti bear glitch protection which only works half of the time but it's better than other macros which will let your character fling all the way to the onett house instead of going to pepper
	Retryy:
	savedata()
	if (convstatus = "Rejoin" && allowrejoinconv = true){
		Reconnect()
		breaktimer := A_Tickcount
		loop 100{
			walk(100,"r")
			if (SearchFunction("e.png",40)[1] = 0){
				Send e
				while (1){
					sleep 1000
					if (SearchFunction("e.png",40)[1] = 1){
						goto,exithmhmqdsf
					}
					if (A_TickCount - breaktimer > 300000){
						goto,exithmhmqdsf
					}
				}
			}
		}
	}
	exithmhmqdsf:
	r(false)
	sleep 2000
	breakytimer := A_TickCount
	resetagain := 0
	while (1){
		if (SearchFunction("BrownBear.png",40)[1] = 0 || SearchFunction("BlackBear.png",40)[1] = 0 || SearchFunction("MotherBear.png",40)[1] = 0 || SearchFunction("PandaBear.png",40)[1] = 0 || SearchFunction("PolarBear.png",40)[1] = 0 || SearchFunction("Sciencebear.png",40)[1] = 0 || ){
			resetagain := resetagain + 1
		}
		if (A_TickCount - breakytimer > 6500){
			break
		}
	}
	if (resetagain > 0){
		goto, Retryy
	}
	breaktimer := A_TickCount
	while (1){
		sleep 100
		if (SearchFunction("hive.png",30)[1] = 0 || SearchFunction("hiven.png",30)[1] = 0){
			global Fails := 0
			camrotate(4,"l")
			Send ooooooooo
			break
		}
		else{
			camrotate(4,"l")
		}
		if (A_TickCount - breaktimer > 15000){
			ErrorLog("Failed to detect hive image")
			if (Fails = 1){
				global Fails := 0
				ErrorLog("Reconnected (Cause : Hive image wasn't found too many times in a row)")
				Reconnect()
				if (tier = 1){
					if (pineconvhive){
						Reset()
					}
				}
				goto,Retryy
			}
			else{
				global Fails := 1
				goto,Retryy
			}
		}
	}
	Send ooooooooo
	loopbreak := A_TickCount
	if (convstatus = "Reset" && convert < 2){
		Send e
		zzz := false
		while (1){
			if (SearchFunction("e.png",40)[1] != 0){
				if (zzz = true){
					sleep 5000
				}
				break
			}
			zzz := true
			if (A_TickCount - loopbreak > 360000){
				break
			}
			safetycheck()
		}	
	}
}

safetycheck(){ ;this will make sure that you stay in the game
	ImageSearch,founx,foundy,A_ScreenWidth/4,A_ScreenHeight/4,A_ScreenWidth/1.5,A_ScreenHeight/1.5,*10 Macro Parts/Images/Disconnected.PNG
	if (errorlevel = 0){
		global reconnected := true
		ErrorLog("Reconnected (Cause : Disconnected.png was found)")
		savedata()
		Reconnect()
		if (tier = 1){
			if (pineconvhive){
				Reset()
			}
		}
	}
	WinActivate, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
	IfWinActive, ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
	{
	}else{
		global reconnected := true
		ErrorLog("Reconnected (Cause : Roblox Window Wasn't Detected)")
		Reconnect()
		if (tier = 1){
			if (pineconvhive){
				Reset()
			}
		}
	}
}

GOField(var,var2){ ;function that takes input and turns it in to an output that lets you go to the field and stuff like that.
	if(var = "Bamboo"){
		bamboo(var2)
	}else if(var = "Blue Flower"){
		bluf(var2)
	}else if(var = "Cactus"){
		cactus(var2)
	}else if(var = "Coconut"){
		coco(var2)
	}else if(var = "Dandelion"){
		dande(var2)
	}else if(var = "Mountain"){
		mountain(var2)
	}else if(var = "Mushroom"){
		mush(var2)
	}else if(var = "Pepper"){
		pep(var2)
	}else if(var = "Pine Tree"){
		pinetree(var2)
	}else if(var = "Pineapple"){
		pineapple(var2)
	}else if(var = "Pumpkin"){
		pump(var2)
	}else if(var = "Rose"){
		rose(var2)
	}else if(var = "Spider"){
		spider(var2)
	}else if(var = "Strawberry"){
		straw(var2)
	}else if(var = "Stump"){
		stump(var2)
	}else if(var = "Sunflower"){
		sunf(var2)
	}else if(var = 0){
		Reset()
	}else if(var = "Plant 1"){
		IniRead,prev1,configs/previous.ini,plantdata,prev1
		GoField(prev1,false)
	}else if(var = "Plant 2"){
		IniRead,prev2,configs/previous.ini,plantdata,prev2
		GoField(prev2,false)
	}else if(var = "Plant 3"){
		IniRead,prev3,configs/previous.ini,plantdata,prev3
		GoField(prev3,false)
	}else if(var = "Clover"){
		clover(var2)
	}
}

checkbufftimer(){ ;checks the timers for the hotbar buffs.
	z := 1
	while (z < 8){
		z := z + 1
		GuiControlGet,hotbar%z%setting
		GuiControlGet,slot%z%delays
		IniRead,hotbar%z%time,configs/previous.ini,hotbardata,hot%z%timer
		if(hotbar%z%setting){
			if(A_TickCount - hotbar%z%time > slot%z%delays*1000){
				SendHotbar(z)
				IniWrite,%A_TickCount%,configs/previous.ini,hotbardata,hot%z%timer
			}
		}
	}
}

SpecificPixelSearchFunction(color,variation,x1,y1,x2,y2){ ;pixelsearch in a function.
	mousemove,A_ScreenWidth/2,A_ScreenHeight/2 ;move mouse to 0,0
	PixelSearch, FoundX, FoundY,%x1%,%y1%,%x2%,%y2%,%color%, *%variation%,fast
	if (errorlevel = 0){
		return [ErrorLevel,FoundX,FoundY]
		return
	}
}

plantcycle(plant){ ;this thing took me way too long to make but ended up being pretty simple to do.
	print := "Running plant " . plant
	Eventlog(print)
	GuiControlGet,harvestfull%plant%
	if (harvestfull%plant%){
		phif := true
	}else{
		phif := false
	}
	
	IniRead,p%plant%cycle,configs/previous.ini,plantdata,cycle%plant%
	pcycle := p%plant%cycle
	pcycle := pcycle + 1
	IniWrite,%pcycle%,configs/previous.ini,plantdata,cycle%plant%
	
	loop 6{
		IniRead,p%plant%cycle,configs/previous.ini,plantdata,cycle%plant%
		pcycle := p%plant%cycle
		if (pcycle > 6){
			pcycle := 1
		}
		IniWrite,%pcycle%,configs/previous.ini,plantdata,cycle%plant%
		
		iniRead,plant%plant%field%pcycle%data,configs/previous.ini,plantdata,plant%plant%field%pcycle%
		iniRead,plant%plant%key%pcycle%data,configs/previous.ini,plantdata,plant%plant%hotkey%pcycle%
		field := plant%plant%field%pcycle%data
		key := plant%plant%key%pcycle%data
		
		IniRead,prev%plant%,configs/previous.ini,plantdata,prev%plant%
		prev := prev%plant%
		if (field = "None"){
			cyclexd := pcycle + 1
			print := "plant " . plant . " cycle " . pcycle . " = None, so going to plant " . plant . " " . cyclexd
			Eventlog(print)
			pcycle := pcycle + 1
			IniWrite,%pcycle%,configs/previous.ini,plantdata,cycle%plant%
			goto,cycleend
		}
		print := "Running plant " . plant . " cycle " . pcycle
		Eventlog(print)
		
		if not (prev = 0){
			GoField(prev,true)
			PlantAction("take",0,phif)
			safetycheck()
			if (phif = true && detectedharvestui = true){
				global detectedharvestui := false
				pcycle--
				IniWrite,%pcycle%,configs/previous.ini,plantdata,cycle%plant%
				return
			}else if (phif = false && detectedharvestui = false){
				GoField(prev,true)
				PlantAction("take",0,phif)
				global convert := convert + 1
			}
		}
		safetycheck()
		global convert := convert + 1
		GoField(field,true)
		PlantAction("place",key,phif)
		IniWrite,%field%,configs/previous.ini,plantdata,prev%plant%
		return
		cycleend:
	}
}

lootplantpath(){ ;this path gets the big loot.
	sleep 2000
	walk(300,"l")
	walk(300,"b")
	zigzag(800,false)
	zigzag(800,false)
	zigzag(800,false)
}

placesprinkler(){ ;without this code the macro would be horrible.
	if(keyboardtype = "azerty"){
		Send &
	}else{
		Send 1
	}
}

Clicker(hi){ ;uses the mouse to click.
	mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
	Send {Click Left Down}
	sleep %hi%
	Send {Click Left Up}
}

fightcheck(){ ;checks if a vicious bee is present.
	savedata()
	sex := false
	sleep 500
	Send /
	sleep 500
	SendInput {Enter}
	sleep 250
	if (keyboardtype = "azerty"){
		Send {Shift}
		sleep 259
		camrotate(1,"l")
	}
	if (SearchFunction("vicattacking.png",20)[1] = 0 || SearchFunction("vicattacking1.png",20)[1] = 0){
		sex := true
		starty := A_TickCount
		if (vicfield = "mountain"){
			walk(1000,"l")
			walk(1500,"b")
			global vicfield := "false"
		}else if (vicfield = "rose"){
			camrotate(2,"r")
			walk(500,"b")
			walk(1500,"l")
			global vicfield := "false"
		}else if (vicfield = "clover"){
			walk(1250,"b")
			walk(1250,"r")
			global vicfield := "false"
		}
		while(1){
			walk(500,"f")
			walk(500,"l")
			walk(500,"b")
			walk(500,"r")
			if (SearchFunction("deadvic.png",20)[1] = 0){
				break
			}
			if (A_TickCount - starty > fightvictime*1000 || A_TickCount - starty > 300000){
				break
			}
		}
	}
	return [sex]
}

viccheck(changecam){ ;check for nighttime.
	savedata()
	if (changecam){
		Send iiiiiiii
		loop 10{
			Send {PGDN}
			sleep 5
		}
		loop 5{
			Send {PGUP}
			sleep 5
		}
		sleep 100
	}
	didvicrun := false
	ImageSearch,Ox,OY,0,0,A_ScreenWidth,150, Macro Parts/images/night.png
	if (ErrorLevel = 0 && killvic = true){
		global convert := 1000
		stingerrun()
		global convert := 0
		didvicrun := true
	}
	if (changecam){
		Send oooooooo
		sleep 5
		Send {PGUP}
		sleep 5
		Send {PGUP}
	}
	return [didvicrun]
}

SearchFunction(image,variation){ ;imagesearch in function so it's nicer to use.
	mousemove,A_ScreenWidth/2,A_ScreenHeight/2
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%variation% Macro Parts\images\%image%
	return [ErrorLevel,FoundX,FoundY]
} 

PixelSearchFunction(color,variation){ ;pixelsearch in function so nicer to use.
	mousemove,A_ScreenWidth/2,A_ScreenHeight/2 ;move mouse to 0,0
	PixelSearch, FoundX, FoundY,0,0,A_ScreenWidth,A_ScreenHeight,%color%, *%variation%,fast
	return [ErrorLevel,FoundX,FoundY]
} 

r(var){ ;kills your character
	SendInput {Escape}
	sleep 250
	SendInput {r}
	sleep 250
	SendInput {Enter}
	sleep 250
	if(var){
		sleep 8000
	}
}

bagcheck(){ ;checks if the bag is full I should have done this with a return but at the time I didn't know how that stuff worked but this works too I guess.
	if (SpecificPixelSearchFunction(0x1700F7,2,0,0,A_ScreenWidth,150)[1] = 0){
		global fullbag := true
	}
}

ServerReboot(){ ;restarts server (this code is bad idk i don't want to rewrite it)
	Reset()
	reboottries := 0
	servrebootstart:
	reboottries++
	if (reboottries < 3){
		Winclose, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		Winclose,ahk_class WINDOWSCLIENT ahk_exe RobloxPlayerBeta.exe
		sleep 1000
		run, www.google.com
		sleep 3000
		run,https://www.roblox.com/games/1537690962/Bee-Swarm-Simulator#!/game-instances
		sleep 3000
		WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		sleep 500
		mousemove,100,100
		var := 0
		foundconf := false
		while (var < 20){
			if (SearchFunction("conf.png",25)[1] = 0){
				mouseMove,SearchFunction("conf.png",25)[2],SearchFunction("conf.png",25)[3]
				sleep 500
				Send {Click Left}
				foundconf := true
				break
			}else{
				WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
				sleep 50
				mousemove,100,100
				Click WheelDown
				sleep 500
				var++
			}
		}
		if (foundconf = false){
			Errorlog("couldn't find conf.png")
			goto,servrebootstart
		}
		if (foundconf){
			Eventlog("found conf.png")
		}
		hmmm := A_TickCount
		counter := 0
		while (1){
			if (SearchFunction("shutdowns.png",10)[1] = 0){
				mousemove,SearchFunction("shutdowns.png",10)[2],SearchFunction("shutdowns.png",10)[3]
				sleep 500
				Send {Click Left}
				Eventlog("Succesfully shut down server")
				Reconnect()
				if (tier = 1){
					GuiControlGet,pineconvhive
					if (pineconvhive){
						Reset()
					}
				}
				return
			}if (SearchFunction("shutdownss.png",10)[1] = 0){
				mousemove,SearchFunction("shutdownss.png",10)[2],SearchFunction("shutdownss.png",10)[3]
				sleep 500
				Send {Click Left}
				Eventlog("Succesfully shut down server")
				Reconnect()
				if (tier = 1){
					GuiControlGet,pineconvhive
					if (pineconvhive){
						Reset()
					}
				}
				return
			}else if (counter < 6){
				counter++
				WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
				sleep 150
				mousemove,100,100
				sleep 259
				Click WheelDown
			}
			if (A_TickCount - hmmm > 10000){
				Errorlog("Failed to shut down server because couldn't find shutdowns.png")
				goto,servrebootstart
			}
		}
	}else{
		Errorlog("Failed to shut down server")
		return
	}
}

Reload(){ ;existed to make encrypted version work, but is now no longer required
	Reload
}

checkplants(timestamp){
	savedata()
	if (planters){
		if (plant1delaydata = timestamp){
			global resetpine := true
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			plantcycle(1)
			safetycheck()
		}
		if (plant2delaydata = timestamp){
			global resetpine := true
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			plantcycle(2)
			safetycheck()
		}
		if (plant3delaydata = timestamp){
			global resetpine := true
			global convert := convert + 1
			if (drstatus){
				r(true)
			}
			plantcycle(3)
			safetycheck()
		}
	}
}
