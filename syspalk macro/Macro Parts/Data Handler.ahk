;;;;;;;;;;
;the variables have to be declared as global otherwise issues will occure due to the macro being split up in multiple files
;;;;;;;;;;

;variable declarations
global 30mtimer
global 1htimer
global 2htimer
global 4htimer
global 22htimer
global 24htimer
global srtimer
global feasttimer
global gingertimer
global candletimer
global samovartimer
global lidtimer
global cogtimer
global hot2timer
global hot3timer
global hot4timer
global hot5timer
global hot6timer
global hot7timer

global fieldpaterns
global fieldpaternsizes
global wealthclock
global blueboosters
global redboosters
global cocooption
global mountainboosterss
global dokb
global dotb
global dogluedisp
global lootplantstatus
global harvestfull1
global harvestfull2
global harvestfull3
global hotbar2setting
global hotbar3setting
global hotbar4setting
global hotbar5setting
global hotbar6setting
global hotbar7setting
global slot2delays
global slot3delays
global slot4delays
global slot5delays
global slot6delays
global slot7delays
global convstatus
global maxtimespentonfield
global keyboard
global sprinktoggle
global jumpstatus
global serverjoinstatus
global drstatus
global planters
global usetool
global haststatus
global shutdownserv
global srtime
global ssboard
global lbsshour
global lbssmin
global squarewaves
global killvic
global fightvictime
global antpasss
global pantstatus
global whenplayanttoggle
global whenplay
global mondokilltype
global pineconvhive

global samovar
global candles
global stockings
global feast
global ginger
global lidart
global cog


global farmfield1
global farmfield2
global farmfield3
global farmfield4
global fieldpatern
global fieldpaternsize
global hotbar2data
global hotbar3data
global hotbar4data
global hotbar5data
global hotbar6data
global hotbar7data
global convsetting
global previousx
global previousy
global keyboardtypeee
global plink1
global plink2
global keyboard
global shutdowndata
global shutdowntime
global ssboarddata
global lbhourdata
global lbmindata
global amountofsquarewaves
global killvic
global fighttimedata
global whenplayantdata
global mondokilldata
global killkbdata
global killtbdata
global antsetting
global blueboostersetting
global redboostersetting
global cocodata
global harvf1
global harvf2
global harvf3
global loot
global jumpdata
global serverdata
global doubleresetdata
global antcheck
global mountaincheck
global turncamdata
global gluedispdata
global tooldata
global sprinkleraligntoggle
global killviccheck
global buyplayant
global pineconvdata
global plants


global turnangle
global pinecornerwalkdata
global pinecornerwait
global pbrd
global pbfd
global bty
global btx
global dirtomovedata
global moveawayms
global movedata
global turncam

;planter variables (for some reason i can't declare global variables with a loop so we will have to do it this way)
global plant1delaydata
global plant2delaydata
global plant3delaydata
global plant1field1data
global plant1field2data
global plant1field3data
global plant1field4data
global plant1field5data
global plant1field6data
global plant2field1data
global plant2field2data
global plant2field3data
global plant2field4data
global plant2field5data
global plant2field6data
global plant3field1data
global plant3field2data
global plant3field3data
global plant3field4data
global plant3field5data
global plant3field6data
global plant1key1data
global plant1key2data
global plant1key3data
global plant1key4data
global plant1key5data
global plant1key6data
global plant2key1data
global plant2key2data
global plant2key3data
global plant2key4data
global plant2key5data
global plant2key6data
global plant3key1data
global plant3key2data
global plant3key3data
global plant3key4data
global plant3key5data
global plant3key6data


global hookevent
global hookerror
global fullbag := false
global vicfield := "false"
global firstcycle
global disconnected
global save
global wenttomondo := false
global reconnected
global guiloaded := false
global p1cycle := 0
global p2cycle := 0
global p3cycle := 0
global prev1 := 0
global prev2 := 0
global prev3 := 0
global reconnectedcannon
global detectedharvestui
global safetynr
global convert := 0
global screenshottedboard := false
global convertedd
global resetpine := false
global previousreconnect := -99999999
global firstpinerun := true
global save := true
global rejoinclaim := true
global allowrejoinconv := true
global openedfarmui := false
global openedplantui := false
global openedbeesmasui := false
global keyboardtype 
global hookballoon
global lastconv := A_TickCount

global tier := 1 ;give highest access


getdata(true)

getdata(loadgui){
	if not(loadgui){
		savedata()
	}
	IniRead,farmfield1,configs/previous.ini, farmfielddata, farmfield1
	iniRead,farmfield2,configs/previous.ini, farmfielddata, farmfield2
	IniRead,farmfield3,configs/previous.ini, farmfielddata, farmfield3
	iniRead,farmfield4,configs/previous.ini, farmfielddata, farmfield4
	iniRead,fieldpatern,configs/previous.ini, farmfielddata, farmpatern
	iniRead,fieldpaternsize,configs/previous.ini, farmfielddata, paternsize
	iniRead,wealthclock,configs/previous.ini,extras,clock
	iniRead,antsetting,configs/previous.ini,extras,antpass
	iniRead,blueboostersetting,configs/previous.ini,extras,bluebooster
	iniRead,redboostersetting,configs/previous.ini,extras,redbooster
	IniRead,cocodata,configs/previous.ini,extras,cocodisp
	IniRead,killkbdata,configs/previous.ini,extras,dokb
	IniRead,killtbdata,configs/previous.ini,extras,dotb
	if (loadgui){
		if(killkbdata){
			global killkbdata := "checked"
		}
		if(killtbdata){
			global killtbdata := "checked"
		}
		if(wealthclock){
			global wealthclock := "checked"
		}if(antsetting){
			global antsetting := "checked"
		}if(blueboostersetting){
			global blueboostersetting := "checked"
		}if(redboostersetting){
			global redboostersetting := "checked"
		}if(cocodata){
			global cocodata := "checked"
		}
	}
	a := 0
	loop 6{
		a++
		b := 0
		loop 3{
			b++
			iniRead,plant%b%field%a%data,configs/previous.ini,plantdata,plant%b%field%a%
			iniRead,plant%b%key%a%data,configs/previous.ini,plantdata,plant%b%hotkey%a%
			iniRead,plant%b%delaydata,configs/previous.ini,plantdata,plant%b%harvesttime
		}
	}
	IniRead,harvf1,configs/previous.ini,plantdata,harvf1
	IniRead,harvf2,configs/previous.ini,plantdata,harvf2
	IniRead,harvf3,configs/previous.ini,plantdata,harvf3
	if (loadgui){
		if (harvf1){
			global harvf1 := "checked"
		}if (harvf2){
			global harvf2 := "checked"
		}if (harvf3){
			global harvf3 := "checked"
		}
	}
	IniRead,loot,configs/previous.ini,plantdata,lootplants
	if (loot && loadgui){
		global loot := "checked"
	}
	iniRead,hotbar2data,configs/previous.ini,hotbardata,hotbar2
	iniRead,hotbar3data,configs/previous.ini,hotbardata,hotbar3
	iniRead,hotbar4data,configs/previous.ini,hotbardata,hotbar4
	iniRead,hotbar5data,configs/previous.ini,hotbardata,hotbar5
	iniRead,hotbar6data,configs/previous.ini,hotbardata,hotbar6
	iniRead,hotbar7data,configs/previous.ini,hotbardata,hotbar7
	IniRead,hotbar2setting,configs/previous.ini,hotbardata,hot2setting
	IniRead,hotbar3setting,configs/previous.ini,hotbardata,hot3setting
	IniRead,hotbar4setting,configs/previous.ini,hotbardata,hot4setting
	IniRead,hotbar5setting,configs/previous.ini,hotbardata,hot5setting
	IniRead,hotbar6setting,configs/previous.ini,hotbardata,hot6setting
	IniRead,hotbar7setting,configs/previous.ini,hotbardata,hot7setting
	if (loadgui){
		if(hotbar2setting){
			global hotbar2setting := "checked"
		}if(hotbar3setting){
			global hotbar3setting := "checked"
		}if(hotbar4setting){
			global hotbar4setting := "checked"
		}if(hotbar5setting){
			global hotbar5setting := "checked"
		}if(hotbar6setting){
			global hotbar6setting := "checked"
		}if(hotbar7setting){
			global hotbar7setting := "checked"
		}
	}
	IniRead,convsetting,configs/previous.ini,settings,convertballoon
	IniRead,maxtimespentonfield,configs/previous.ini,settings,maxtimeonfield
	IniRead,jumpdata,configs/previous.ini,settings,jump
	if (jumpdata && loadgui){
		global jumpdata := "checked"
	}
	IniRead,serverdata,configs/previous.ini,settings,serverdata
	if (serverdata && loadgui){
		global serverdata := "checked"
	}
	IniRead,doubleresetdata,configs/previous.ini,settings,dreset
	if (doubleresetdata && loadgui){
		global doubleresetdata := "checked"
	}
	IniRead,planters,configs/previous.ini,settings,planters
	if (planters){
		global planters := "checked"
	}
	IniRead,haststatus,configs/previous.ini,settings,hasty
	IniRead,previousx,configs/previous.ini,gui,previousx
	IniRead,previousy,configs/previous.ini,gui,previousy
	IniRead,plink1,configs/privlinks.ini,xd,l1
	IniRead,plink2,configs/privlinks.ini,xd,l2
	IniRead,keyboardtypeee,configs/previous.ini,gui,keyboard
	IniRead,antcheck,configs/previous.ini,extras,playants
	if (antcheck && loadgui){
		global antcheck := "checked"
	}
	IniRead,whenplayantdata,configs/previous.ini,extras,whenplayantdata
	IniRead,mondokilldata,configs/previous.ini,extras,mondokilldata
	IniRead,mountaincheck,configs/previous.ini,extras,mountainbooster
	if (mountaincheck && loadgui){
		global mountaincheck := "checked"
	}
	IniRead,shutdowntime,configs/previous.ini,advanced,shutdowntime
	IniRead,shutdowndata,configs/previous.ini,advanced,shutdownsetting
	IniRead,tooldata,configs/previous.ini,advanced,tooldata
	IniRead,gluedispdata,configs/previous.ini,extras,dogluedisp
	IniRead,turncamdata,configs/previous.ini,advanced,turncam
	IniRead,ssboarddata,configs/previous.ini,advanced,ssboarddata
	if (loadgui){
		if (ssboarddata){
			global ssboarddata := "checked"
		}
		if (turncamdata){
			global turncamdata := "checked"
		}
		if (gluedispdata){
			global gluedispdata := "checked"
		}
		if (tooldata){
			global tooldata := "checked"
		}
		if (shutdowndata){
			global shutdowndata := "checked"
		}
	}
	IniRead,sprinkleraligntoggle,configs/previous.ini,advanced,sprinkleraligntoggle
	if (sprinkleraligntoggle && loadgui){
		global sprinkleraligntoggle := "checked"
	}
	IniRead,camturnangle,configs/previous.ini,advanced,turnangle
	IniRead,lbhourdata,configs/previous.ini,advanced,lbhourdata
	IniRead,lbmindata,configs/previous.ini,advanced,lbmindata
	IniRead,pinecornerwalkdata,configs/previous.ini,advanced,pinecornerwalkdata
	IniRead,pinecornerwait,configs/previous.ini,advanced,pinecornerwait
	IniRead,pbrd,configs/previous.ini,advanced,pbrd
	IniRead,pbfd,configs/previous.ini,advanced,pbfd
	IniRead,bty,configs/previous.ini,advanced,bty
	IniRead,btx,configs/previous.ini,advanced,btx
	IniRead,dirtomovedata,configs/previous.ini,advanced,dirtomovedata
	IniRead,moveawayms,configs/previous.ini,advanced,moveawayms
	IniRead,movedata,configs/previous.ini,advanced,movedata
	IniRead,amountofsquarewaves,configs/previous.ini,advanced,amountofsquarewaves
	IniRead,fighttimedata,configs/previous.ini,advanced,fighttimedata
	IniRead,killviccheck,configs/previous.ini,advanced,killviccheck
	if (killviccheck && loadgui){
		global killviccheck := "checked"
	}if (movedata && loadgui){
		global movedata := "checked"
	}
	IniRead,pineconvdata,configs/previous.ini,advanced,pineconvdata
	IniRead,buyplayant,configs/previous.ini,extras,buyplayant
	if (buyplayant && loadgui){
		global buyplayant := "checked"
	}if (pineconvdata && loadgui){
		global pineconvdata := "checked"
	}
	
	
	IniRead,keyboard,configs/previous.ini,gui,keyboard
	if(keyboard = "azerty"){
		global keyboardtype := "azerty"
	}else if (keyboard = "qwertz"){
		global keyboardtype := "qwertz"
	}else{
		global keyboardtype := "qwerty"
	}
	IniRead,30mtimer,configs/previous.ini,extras,30mtimer
	IniRead,1htimer,configs/previous.ini,extras,1htimer
	IniRead,2htimer,configs/previous.ini,extras,2htimer
	IniRead,4htimer,configs/previous.ini,extras,4htimer
	IniRead,22htimer,configs/previous.ini,advanced,22htimer
	IniRead,24htimer,configs/previous.ini,advanced,24htimer
	IniRead,srtimer,configs/previous.ini,advanced,srtimer
	IniRead,feasttimer,configs/previous.ini,beesmas,feasttimer
	IniRead,gingertimer,configs/previous.ini,beesmas,gingertimer
	IniRead,candletimer,configs/previous.ini,beesmas,candletimer
	IniRead,samovartimer,configs/previous.ini,beesmas,samovartimer
	IniRead,lidtimer,configs/previous.ini,beesmas,lidtimer
	IniRead,cogtimer,configs/previous.ini,beesmas,cogtimer
	IniRead,hotbar2time,configs/previous.ini,hotbardata,hot2timer
	IniRead,hotbar3time,configs/previous.ini,hotbardata,hot3timer
	IniRead,hotbar4time,configs/previous.ini,hotbardata,hot4timer
	IniRead,hotbar5time,configs/previous.ini,hotbardata,hot5timer
	IniRead,hotbar6time,configs/previous.ini,hotbardata,hot6timer
	IniRead,hotbar7time,configs/previous.ini,hotbardata,hot7timer
	
	IniRead,hookevent,configs/privlinks.ini,webhooks,events
	IniRead,hookerror,configs/privlinks.ini,webhooks,errors
	IniRead,hookballoon,configs/privlinks.ini,webhooks,balloon
}

savedata(){ ;this allows the macro to save data
	if(save = true){
		GuiControlGet,farmfield1
		GuiControlGet,farmfield2
		GuiControlGet,farmfield3
		GuiControlGet,farmfield4
		GuiControlGet,fieldpaterns
		GuiControlGet,fieldpaternsizes
		GuiControlGet,wealthclock
		GuiControlGet,mondos
		GuiControlGet,antpasss
		GuiControlGet,blueboosters
		GuiControlGet,redboosters
		GuiControlGet,hotbar2setting
		GuiControlGet,hotbar3setting
		GuiControlGet,hotbar4setting
		GuiControlGet,hotbar5setting
		GuiControlGet,hotbar6setting
		GuiControlGet,hotbar7setting
		GuiControlGet,slot2delays
		GuiControlGet,slot3delays
		GuiControlGet,slot4delays
		GuiControlGet,slot5delays
		GuiControlGet,slot6delays
		GuiControlGet,slot7delays
		GuiControlGet,plant1delaydata
		GuiControlGet,plant2delaydata
		GuiControlGet,plant3delaydata
		GuiControlGet,privatelink
		GuiControlGet,convstatus
		GuiControlGet,maxtimespentonfield
		GuiControlGet,lootplantstatus
		GuiControlGet,keyboard
		GuiControlGet,harvestfull1
		GuiControlGet,harvestfull2
		GuiControlGet,harvestfull3
		GuiControlGet,pantstatus
		GuiControlGet,mountainboosterss
		GuiControlGet,jumpstatus
		GuiControlGet,serverjoinstatus
		GuiControlGet,haststatus
		GuiControlGet,drstatus
		GuiControlGet,cocooption
		GuiControlGet,planters
		GuiControlGet,srtime
		GuiControlGet,shutdownserv
		GuiControlGet,usetool
		GuiControlGet,dogluedisp
		GuiControlGet,gumhotkey
		GuiControlGet,dokb
		GuiControlGet,dotb
		GuiControlGet,ssboard
		GuiControlGet,lbsshour
		GuiControlGet,lbssmin
		GuiControlGet,squarewaves
		GuicontrolGet,pineconvhive
		GuiControlGet,sprinktoggle
		GuiControlGet,fightvictime
		GuiControlGet,killvic
		GuiControlGet,whenplayanttoggle
		GuiControlGet,whenplay
		GuiControlGet,mondokilltype
		Gui,1:+LastFound
		WinGetPos,x,y
		if (openedfarmui){
			savefarmui()
		}
		if (openedplantui){
			saveplantui()
		}
		savebeesmasui()
		IniWrite,%lbsshour%,configs/previous.ini,advanced,lbhourdata
		IniWrite,%lbssmin%,configs/previous.ini,advanced,lbmindata
		IniWrite,%ssboard%,configs/previous.ini,advanced,ssboarddata
		IniWrite,%dogluedisp%,configs/previous.ini,extras,dogluedisp
		IniWrite,%shutdownserv%,configs/previous.ini,advanced,shutdownsetting
		IniWrite,%srtime%,configs/previous.ini,advanced,shutdowntime
		IniWrite,%squarewaves%,configs/previous.ini,advanced,amountofsquarewaves
		IniWrite,%pineconvhive%,configs/previous.ini,advanced,pineconvdata
		IniWrite,%mondokilltype%,configs/previous.ini,extras,mondokilldata
		IniWrite,%whenplayanttoggle%,configs/previous.ini,extras,buyplayant
		IniWrite,%whenplay%,configs/previous.ini,extras,whenplayantdata
		IniWrite,%fightvictime%,configs/previous.ini,advanced,fighttimedata
		IniWrite,%killvic%,configs/previous.ini,advanced,killviccheck
		IniWrite,%sprinktoggle%,configs/previous.ini,advanced,sprinkleraligntoggle
		IniWrite,%dokb%,configs/previous.ini,extras,dokb
		IniWrite,%dotb%,configs/previous.ini,extras,dotb
		IniWrite,%usetool%,configs/previous.ini,advanced,tooldata
		IniWrite,%farmfield1%,configs/previous.ini,farmfielddata,farmfield1
		IniWrite,%farmfield2%,configs/previous.ini,farmfielddata,farmfield2
		IniWrite,%farmfield3%,configs/previous.ini,farmfielddata,farmfield3
		IniWrite,%farmfield4%,configs/previous.ini,farmfielddata,farmfield4
		IniWrite,%fieldpaterns%,configs/previous.ini,farmfielddata,farmpatern
		IniWrite,%fieldpaternsizes%,configs/previous.ini,farmfielddata,paternsize
		iniWrite,%wealthclock%,configs/previous.ini,extras,clock
		iniWrite,%mondos%,configs/previous.ini,extras,mondo
		iniWrite,%antpasss%,configs/previous.ini,extras,antpass
		iniWrite,%blueboosters%,configs/previous.ini,extras,bluebooster
		iniWrite,%redboosters%,configs/previous.ini,extras,redbooster
		IniWrite,%hotbar2setting%,configs/previous.ini,hotbardata,hot2setting
		IniWrite,%hotbar3setting%,configs/previous.ini,hotbardata,hot3setting
		IniWrite,%hotbar4setting%,configs/previous.ini,hotbardata,hot4setting
		IniWrite,%hotbar5setting%,configs/previous.ini,hotbardata,hot5setting
		IniWrite,%hotbar6setting%,configs/previous.ini,hotbardata,hot6setting
		IniWrite,%hotbar7setting%,configs/previous.ini,hotbardata,hot7setting
		IniWrite,%slot2delays%,configs/previous.ini,hotbardata,hotbar2
		IniWrite,%slot3delays%,configs/previous.ini,hotbardata,hotbar3
		IniWrite,%slot4delays%,configs/previous.ini,hotbardata,hotbar4
		IniWrite,%slot5delays%,configs/previous.ini,hotbardata,hotbar5
		IniWrite,%slot6delays%,configs/previous.ini,hotbardata,hotbar6
		IniWrite,%slot7delays%,configs/previous.ini,hotbardata,hotbar7
		IniWrite,%plant1delaydata%,configs/previous.ini,plantdata,plant1harvesttime
		IniWrite,%plant2delaydata%,configs/previous.ini,plantdata,plant2harvesttime
		IniWrite,%plant3delaydata%,configs/previous.ini,plantdata,plant3harvesttime
		IniWrite,%maxtimespentonfield%,configs/previous.ini,settings,maxtimeonfield
		IniWrite,%convstatus%,configs/previous.ini,settings,convertballoon
		IniWrite,%x%,configs/previous.ini,gui,previousx
		IniWrite,%y%,configs/previous.ini,gui,previousy
		IniWrite,%lootplantstatus%,configs/previous.ini,plantdata,lootplants
		IniWrite,%keyboard%,configs/previous.ini,gui,keyboard
		IniWrite,%harvestfull1%,configs/previous.ini,plantdata,harvf1
		IniWrite,%harvestfull2%,configs/previous.ini,plantdata,harvf2
		IniWrite,%harvestfull3%,configs/previous.ini,plantdata,harvf3
		IniWrite,%pantstatus%,configs/previous.ini,extras,playants
		IniWrite,%mountainboosterss%,configs/previous.ini,extras,mountainbooster
		IniWrite,%jumpstatus%,configs/previous.ini,settings,jump
		IniWrite,%serverjoinstatus%,configs/previous.ini,settings,serverdata
		IniWrite,%haststatus%,configs/previous.ini,settings,hasty
		IniWrite,%drstatus%,configs/previous.ini,settings,dreset
		IniWrite,%cocooption%,configs/previous.ini,extras,cocodisp
		IniWrite,%planters%,configs/previous.ini,settings,planters
		IniRead,30mtimer,configs/previous.ini,extras,30mtimer
		IniRead,1htimer,configs/previous.ini,extras,1htimer
		IniRead,2htimer,configs/previous.ini,extras,2htimer
		IniRead,4htimer,configs/previous.ini,extras,4htimer
		IniRead,22htimer,configs/previous.ini,advanced,22htimer
		IniRead,24htimer,configs/previous.ini,advanced,24htimer
		IniRead,srtimer,configs/previous.ini,advanced,srtimer
		IniRead,feasttimer,configs/previous.ini,beesmas,feasttimer
		IniRead,gingertimer,configs/previous.ini,beesmas,gingertimer
		IniRead,candletimer,configs/previous.ini,beesmas,candletimer
		IniRead,samovartimer,configs/previous.ini,beesmas,samovartimer
		IniRead,lidtimer,configs/previous.ini,beesmas,lidtimer
		IniRead,cogtimer,configs/previous.ini,beesmas,cogtimer
		IniRead,hotbar2time,configs/previous.ini,hotbardata,hot2timer
		IniRead,hotbar3time,configs/previous.ini,hotbardata,hot3timer
		IniRead,hotbar4time,configs/previous.ini,hotbardata,hot4timer
		IniRead,hotbar5time,configs/previous.ini,hotbardata,hot5timer
		IniRead,hotbar6time,configs/previous.ini,hotbardata,hot6timer
		IniRead,hotbar7time,configs/previous.ini,hotbardata,hot7timer
	}
}

Resetconfigfile(){ ;wipes the config file
	global save := false
	
	IniWrite,0,configs/previous.ini,beesmas,samovar
	IniWrite,0,configs/previous.ini,beesmas,candles
	IniWrite,0,configs/previous.ini,beesmas,stockings
	IniWrite,0,configs/previous.ini,beesmas,feast
	IniWrite,0,configs/previous.ini,beesmas,ginger
	IniWrite,0,configs/previous.ini,beesmas,lidart
	IniWrite,0,configs/previous.ini,beesmas,cog
	
	IniWrite,No Kill,configs/previous.ini,extras,mondokilldata
	IniWrite,0,configs/previous.ini,extras,buyplayant
	IniWrite,2 hours,configs/previous.ini,extras,whenplayantdata
	IniWrite,1,configs/previous.ini,advanced,sprinkleraligntoggle
	IniWrite,60,configs/previous.ini,advanced,fighttimedata
	IniWrite,0,configs/previous.ini,advanced,killviccheck
	IniWrite,0,configs/previous.ini,advanced,pineconvdata
	IniWrite,2,configs/previous.ini,advanced,amountofsquarewaves
	IniWrite,0,configs/previous.ini,advanced,turncam
	IniWrite,None,configs/previous.ini,advanced,turnangle
	IniWrite,1800,configs/previous.ini,advanced,pinecornerwalkdata
	IniWrite,6000,configs/previous.ini,advanced,pinecornerwait
	IniWrite,0.36,configs/previous.ini,advanced,pbrd
	IniWrite,1.1,configs/previous.ini,advanced,pbfd
	IniWrite,600,configs/previous.ini,advanced,bty
	IniWrite,120,configs/previous.ini,advanced,btx
	IniWrite,None,configs/previous.ini,advanced,dirtomovedata
	IniWrite,0,configs/previous.ini,advanced,moveawayms
	IniWrite,0,configs/previous.ini,advanced,movedata
	IniWrite,None,configs/previous.ini,farmfielddata,farmfield1
	IniWrite,None,configs/previous.ini,farmfielddata,farmfield2
	IniWrite,None,configs/previous.ini,farmfielddata,farmfield3
	IniWrite,None,configs/previous.ini,farmfielddata,farmfield4
	IniWrite,None,configs/previous.ini,farmfielddata,farmpatern
	IniWrite,None,configs/previous.ini,farmfielddata,paternsize
	iniWrite,0,configs/previous.ini,extras,clock
	iniWrite,0,configs/previous.ini,extras,antpass
	iniWrite,0,configs/previous.ini,extras,bluebooster
	iniWrite,0,configs/previous.ini,extras,redbooster
	IniWrite,0,configs/previous.ini,extras,dokb
	IniWrite,0,configs/previous.ini,extras,dotb
	IniWrite,None,configs/previous.ini,plantdata,plant1field1
	IniWrite,None,configs/previous.ini,plantdata,plant1field2
	IniWrite,None,configs/previous.ini,plantdata,plant1field3
	IniWrite,None,configs/previous.ini,plantdata,plant1field4
	IniWrite,None,configs/previous.ini,plantdata,plant1field5
	IniWrite,None,configs/previous.ini,plantdata,plant1field6
	IniWrite,None,configs/previous.ini,plantdata,plant2field1
	IniWrite,None,configs/previous.ini,plantdata,plant2field2
	IniWrite,None,configs/previous.ini,plantdata,plant2field3
	IniWrite,None,configs/previous.ini,plantdata,plant2field4
	IniWrite,None,configs/previous.ini,plantdata,plant2field5
	IniWrite,None,configs/previous.ini,plantdata,plant2field6
	IniWrite,None,configs/previous.ini,plantdata,plant3field1
	IniWrite,None,configs/previous.ini,plantdata,plant3field2
	IniWrite,None,configs/previous.ini,plantdata,plant3field3
	IniWrite,None,configs/previous.ini,plantdata,plant3field4
	IniWrite,None,configs/previous.ini,plantdata,plant3field5
	IniWrite,None,configs/previous.ini,plantdata,plant3field6
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey1
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey2
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey3
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey4
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey5
	IniWrite,None,configs/previous.ini,plantdata,plant1hotkey6
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey1
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey2
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey3
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey4
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey5
	IniWrite,None,configs/previous.ini,plantdata,plant2hotkey6
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey1
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey2
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey3
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey4
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey5
	IniWrite,None,configs/previous.ini,plantdata,plant3hotkey6
	IniWrite,0,configs/previous.ini,hotbardata,hot2setting
	IniWrite,0,configs/previous.ini,hotbardata,hot3setting
	IniWrite,0,configs/previous.ini,hotbardata,hot4setting
	IniWrite,0,configs/previous.ini,hotbardata,hot5setting
	IniWrite,0,configs/previous.ini,hotbardata,hot6setting
	IniWrite,0,configs/previous.ini,hotbardata,hot7setting
	IniWrite,0,configs/previous.ini,hotbardata,hotbar2
	IniWrite,0,configs/previous.ini,hotbardata,hotbar3
	IniWrite,0,configs/previous.ini,hotbardata,hotbar4
	IniWrite,0,configs/previous.ini,hotbardata,hotbar5
	IniWrite,0,configs/previous.ini,hotbardata,hotbar6
	IniWrite,0,configs/previous.ini,hotbardata,hotbar7
	IniWrite,1 hour,configs/previous.ini,plantdata,plant1harvesttime
	IniWrite,1 hour,configs/previous.ini,plantdata,plant2harvesttime
	IniWrite,1 hour,configs/previous.ini,plantdata,plant3harvesttime
	IniWrite,None,configs/previous.ini,settings,convertballoon
	IniWrite,5,configs/previous.ini,settings,maxtimeonfield
	resettimers()
	IniWrite,0,configs/previous.ini,plantdata,prev1
	IniWrite,0,configs/previous.ini,plantdata,prev2
	IniWrite,0,configs/previous.ini,plantdata,prev3
	IniWrite,0,configs/previous.ini,plantdata,cycle1
	IniWrite,0,configs/previous.ini,plantdata,cycle2
	IniWrite,0,configs/previous.ini,plantdata,cycle3
	IniWrite,0,configs/previous.ini,plantdata,lootplants
	IniWrite,qwerty,configs/previous.ini,gui,keyboard
	IniWrite,0,configs/previous.ini,plantdata,harvf1
	IniWrite,0,configs/previous.ini,plantdata,harvf2
	IniWrite,0,configs/previous.ini,plantdata,harvf3
	IniWrite,0,configs/previous.ini,extras,playants
	IniWrite,0,configs/previous.ini,extras,mountainbooster
	IniWrite,0,configs/previous.ini,settings,jump
	IniWrite,0,configs/previous.ini,settings,serverdata
	IniWrite,28,configs/previous.ini,settings,hasty
	IniWrite,0,configs/previous.ini,settings,dreset
	IniWrite,0,configs/previous.ini,extras,cocodisp
	IniWrite,1,configs/previous.ini,settings,planters
	IniWrite,0,configs/previous.ini,advanced,shutdownsetting
	IniWrite,0,configs/previous.ini,advanced,shutdowntime
	IniWrite,1,configs/previous.ini,advanced,tooldata
	IniWrite,0,configs/previous.ini,extras,dogluedisp
	IniWrite,None,configs/previous.ini,advanced,turnangle
	IniWrite,None,configs/previous.ini,advanced,lbhourdata
	IniWrite,None,configs/previous.ini,advanced,lbmindata
	IniWrite,0,configs/previous.ini,advanced,ssboarddata
	Reload()
}

errorcheck(){ ;checks for faulthy combinations
	a := 0
	loop 6{
		a++
		b := 0
		loop 3{
			b++
			iniRead,plant%b%field%a%data,configs/previous.ini,plantdata,plant%b%field%a%
			iniRead,plant%b%key%a%data,configs/previous.ini,plantdata,plant%b%hotkey%a%
			iniRead,plant%b%delaydata,configs/previous.ini,plantdata,plant%b%harvesttime
		}
	}
	
	GuiControlGet,pantstatus
	GuiControlGet,antpasss
	GuiControlGet,srtime
	GuiControlGet,shutdownserv
	GuiControlGet,gumhotkey
	GuiControlGet,dogluedisp
	GuiControlGet,rotdegrees
	GuiControlGet,turncam
	GuiControlGet,ssboard
	GuiControlGet,lbsshour
	GuiControlGet,lbssmin
	
	if (ssboard){
		if (lbsshour = "None" && lbssmin = "None"){
			msgbox,ERROR : screenshot leaderboard is enabled but there is no specific time sellected, please change this and try again.
			savedata()
			Reload()
		}
		if (lbsshour = "None"){
			msgbox,ERROR : screenshot leaderboard is enabled but there is no hour sellected, please change this and try again.
			savedata()
			Reload()
		}
		if (lbssmin = "None"){
			msgbox,ERROR : screenshot leaderboard is enabled but there are no minutes sellected, please change this and try again.
			savedata()
			Reload()
		}
	}
	
	if (turncam && rotdegrees = "None"){
		msgbox,ERROR : turn camera is enabled but there is no angle sellected, please change this and try again.
		savedata()
		Reload()
	}
	
	if (dogluedisp && gumhotkey = "None"){
		msgbox,ERROR : glue dispensor is enabled but there is no hotkey sellected, please change this and try again.
		savedata()
		Reload()
	}
	
	if (shutdownserv && srtime < 5){
		msgbox,ERROR : shut down server is enabled and the time to reset the server is set to below 5 minutes, this will result in you spamming the server shutdown button, please change this and try again.
		savedata()
		Reload()
	}
	
	sd := 0
	loop 6{
		sd++
		if not(plant1key%sd%data = "None" || plant2key%sd%data = "None"){
			if (plant1key%sd%data = plant2key%sd%data){
				msgbox,ERROR : Plant 1 key %sd% is overlapping with Plant 2 key %sd%, please change this and try again.
				savedata()
				Reload()
			}
		}
		if not(plant1key%sd%data = "None" || plant3key%sd%data = "None"){
			if (plant1key%sd%data = plant3key%sd%data){
				msgbox,ERROR : Plant 1 key %sd% is overlapping with Plant 3 key %sd%, please change this and try again.
				savedata()
				Reload()
			}
		}
		if not(plant2key%sd%data = "None" || plant3key%sd%data = "None"){
			if (plant2key%sd%data = plant3key%sd%data){
				msgbox,ERROR : Plant 2 key %sd% is overlapping with Plant 3 key %sd%, please change this and try again.
				savedata()
				Reload()
			}
		}
	}
	
	var := 0
	loop 3{
		var++
		sd := 0
		loop 6{
			sd++
			if not(plant%var%field%sd%data = "None"){
				if (plant%var%key%sd%data = "None"){
					msgbox,ERROR : Plant %var% Field %sd% selected but there is no matching hotkey selected, please change this and try again.
					savedata()
					Reload()
				}
			}
		}
	}
	
	sd := 0
	loop 6{
		sd++
		var := 0
		loop 2{
			varr := sd - 1
			if (varr = 0){
				varr := 6
			}
			var++
			if (var = 1 && plant%var%key%sd%data != "None"){
				if ( plant%var%key%sd%data = plant2key%varr%data || plant%var%key%sd%data = plant3key%varr%data){
					msgbox,ERROR : This planter composition is impossible, plant %var% key %sd% can not equal plant 2 key %varr% or plant 3 key %varr%, please change this and try again.
					savedata()
					Reload()
				}
			}
			if (var = 2 && plant%var%key%sd%data != "None"){
				if (plant%var%key%sd%data = plant3key%varr%data){
					msgbox,ERROR : This planter composition is impossible, plant %var% key %sd% can not equal plant 1 key %varr% or plant 3 key %varr%, please change this and try again.
					savedata()
					Reload()
				}
			}
		}
	}
	
	
	if (pantstatus){
		if (antpasss = false){
			msgbox,ERROR : play ants selected but antpass is disabled, antpass needs to be enabled in order to be able to play ants, please change this and try again.
			savedata()
			Reload()
		}
	}
}

savefarmui(){ ;saves the whole farm ui
	GuiControlGet,turncam,farm:
	GuiControlGet,turnangle,farm:
	GuiControlGet,pinecornerwalkdata,farm:
	GuiControlGet,pinecornerwait,farm:
	GuiControlGet,pbrd,farm:
	GuiControlGet,pbfd,farm:
	GuiControlGet,sprinktoggle,farm:
	GuiControlGet,btx,farm:
	GuiControlGet,bty,farm:
	GuiControlGet,movedata,farm:
	GuiControlGet,moveawayms,farm:
	GuiControlGet,dirtomovedata,farm:
	IniWrite,%turncam%,configs/previous.ini,advanced,turncam
	IniWrite,%turnangle%,configs/previous.ini,advanced,turnangle
	IniWrite,%pinecornerwalkdata%,configs/previous.ini,advanced,pinecornerwalkdata
	IniWrite,%pinecornerwait%,configs/previous.ini,advanced,pinecornerwait
	IniWrite,%pbrd%,configs/previous.ini,advanced,pbrd
	IniWrite,%pbfd%,configs/previous.ini,advanced,pbfd
	IniWrite,%bty%,configs/previous.ini,advanced,bty
	IniWrite,%btx%,configs/previous.ini,advanced,btx
	IniWrite,%dirtomovedata%,configs/previous.ini,advanced,dirtomovedata
	IniWrite,%moveawayms%,configs/previous.ini,advanced,moveawayms
	IniWrite,%movedata%,configs/previous.ini,advanced,movedata
	sleep 500
}

saveplantui(){ ;saves the whole plant ui
	global a := 0
	loop 3{ ;the syntax of a for loop in ahk is confusing leave me alone this also works plus you like men
		a++
		global b := 0
		loop 6{
			b++
			GuiControlGet,plant%a%field%b%data,plant:
			var := plant%a%field%b%data
			IniWrite,%var%,configs/previous.ini,plantdata,plant%a%field%b%
			GuiControlGet,plant%a%key%b%data,plant:
			var := plant%a%key%b%data
			IniWrite,%var%,configs/previous.ini,plantdata,plant%a%hotkey%b%
		}
	}
}

savebeesmasui(){ ;saves the whole beesmas ui
	if (openedbeesmasui = true){
		GuiControlGet,samovar,beesmas:
		GuiControlGet,candles,beesmas:
		GuiControlGet,stockings,beesmas:
		GuiControlGet,feast,beesmas:
		GuiControlGet,ginger,beesmas:
		GuiControlGet,lidart,beesmas:
		GuiControlGet,cog,beesmas:
		IniWrite,%samovar%,configs/previous.ini,beesmas,samovar
		IniWrite,%candles%,configs/previous.ini,beesmas,candles
		IniWrite,%stockings%,configs/previous.ini,beesmas,stockings
		IniWrite,%feast%,configs/previous.ini,beesmas,feast
		IniWrite,%ginger%,configs/previous.ini,beesmas,ginger
		IniWrite,%lidart%,configs/previous.ini,beesmas,lidart
		IniWrite,%cog%,configs/previous.ini,beesmas,cog
	}
}

resetplantsettings(){ ;resets all the plant settings
	a := 0
	loop 3{
		a++
		b := 0
		loop 6{
			b++
			iniWrite,None,configs/previous.ini,plantdata,plant%a%field%b%
			iniWrite,None,configs/previous.ini,plantdata,plant%a%hotkey%b%
		}
		IniWrite,0,configs/previous.ini,plantdata,prev%a%
		iniWrite,1 hour,configs/previous.ini,plantdata,plant%a%harvesttime
		IniWrite,0,configs/previous.ini,plantdata,harvf%a%
	}
	IniWrite,0,configs/previous.ini,plantdata,lootplants
}