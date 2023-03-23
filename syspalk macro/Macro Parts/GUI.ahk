;gui creation
global textcol := "cred"

loadmainui(){
	global start := A_TickCount
	Gui, Font, s10 bold
	Gui,Color,black
	
	Gui, Add, Tab, x1 y1 w500 h250 cred ,Main|Plants|Buffs|Settings|advanced|stuff|more
	
	
	Gui,Tab,1
	Gui, Add, Button, x20 y210, Start (F1)
	Gui, Add, Button, x120 y210, Reload (F2)
	Gui, Add, text, x230 y215 %textcol%, Press F3 to pause/unpause the script
	Gui, Add,Text, x10 y40 %textcol%,Farm Fields
	Gui, Add,DropDownList, xp+90 y35 w90 h200 vfarmfield1,%farmfield1%||None|bugrun&polar|Plant 1|Plant 2|Plant 3|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, Add,DropDownList, xp+100 y35 w90 h200 vfarmfield2,%farmfield2%||None|bugrun&polar|Plant 1|Plant 2|Plant 3|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, Add,DropDownList, xp+100 y35 w90 h200 vfarmfield3,%farmfield3%||None|bugrun&polar|Plant 1|Plant 2|Plant 3|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, Add,DropDownList, xp+100 y35 w90 h200 vfarmfield4,%farmfield4%||None|bugrun&polar|Plant 1|Plant 2|Plant 3|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, Add,Text, x10 y80 %textcol%,Farm Pattern
	if (tier = 1){
		Gui, Add,DropDownList, xp+90 yp-5 w90 h200 vfieldpaterns,%fieldpatern%||None|zigzag|squares|bettertokenzigzag|custombettertokenzigzag
	}
	else if (tier = 3 || tier = 2){
		Gui, Add,DropDownList, xp+90 yp-5 w90 h200 vfieldpaterns,%fieldpatern%||None|zigzag|squares|bettertokenzigzag|custombettertokenzigzag
	}else{
		Gui, Add,DropDownList, xp+90 yp-5 w90 h200 vfieldpaterns,%fieldpatern%||None|zigzag|squares|bettertokenzigzag
	}
	Gui, Add,Text , xp+110 yp+5 %textcol%,Pattern size
	Gui, Add,DropDownList, xp+90 yp-5 w90 h200 vfieldpaternsizes,%fieldpaternsize%||small|medium|large
	Gui, Add,GroupBox, x10 y100 w465 h100 %textcol%,extras
	Gui, Add, Checkbox, xp+10 yp+30 vwealthclock %textcol% %wealthclock%,Clock
	Gui, Add, Checkbox, xp yp+20 vblueboosters %textcol% %blueboostersetting%, blue booster
	Gui, Add, Checkbox, xp yp+20 vredboosters %textcol% %redboostersetting%, red booster
	Gui, Add,Checkbox, xp+120 yp-40 vcocooption %textcol% %cocodata%,coco disp
	Gui, Add,Checkbox, xp yp+20 vmountainboosterss %textcol% %mountaincheck%, mixed booster
	Gui, Add,Checkbox, xp yp+20 vdokb %textcol% %killkbdata%, kill kb
	Gui, Add,Checkbox, xp+130 yp-40 vdotb %textcol% %killtbdata%,kill tb
	Gui, Add,Checkbox,vdogluedisp xp yp+20 %gluedispdata% %textcol%,glue disp
	Gui, Add,Button, w100 h30 xp+95 yp-5,Beesmas UI
	Gui, Tab,2
	Gui, Add,GroupBox, x20 y40 w200 h200 %textcol%, extra plant stuff
	gui, Add,Text, xp+70 yp+20 cblue,harvest time
	Gui, Add,Text, xp-60 yp+30 %textcol%, plant 1
	Gui, Add,DropDownList, xp+60 yp-5 w90 h140 vplant1delaydata,%plant1delaydata%||30 min|1 hour|2 hours|4 hours
	Gui, Add,Text, xp-60 yp+30 %textcol%, plant 2
	Gui, Add,DropDownList, xp+60 yp-5 w90 h140 vplant2delaydata,%plant2delaydata%||30 min|1 hour|2 hours|4 hours
	Gui, Add,Text, xp-60 yp+30 %textcol%, plant 3
	Gui, Add,DropDownList, xp+60 yp-5 w90 h140 vplant3delaydata,%plant3delaydata%||30 min|1 hour|2 hours|4 hours
	Gui, Add,Button,xp-50 yp+50,Reset Plant Settings
	Gui, Add,GroupBox, x230 y40 w260 h200 %textcol%, even more plant stuff
	Gui, Add, CheckBox, xp+10 yp+35 vlootplantstatus %textcol% %loot%, loot planters
	Gui, Add,CheckBox, xp yp+35 vharvestfull1 %textcol% %harvf1%, harvest plant 1 when fully grown
	Gui, Add,CheckBox, xp yp+20 vharvestfull2 %textcol% %harvf2%, harvest plant 2 when fully grown
	Gui, Add,CheckBox, xp yp+20 vharvestfull3 %textcol% %harvf3%, harvest plant 3 when fully grown
	Gui, Add,Button, xp yp+35,Plantcycles
	Gui, Add,Button, xp+100 yp w140 h30,Reset Cycle Data
	Gui, Tab,3
	Gui, Add,Text, x130 y40 cblue, time in seconds
	Gui, Add, Checkbox, xp-120 yp+30 vhotbar2setting %textcol% %hotbar2setting%,hotbar slot 2
	Gui, Add,Edit,vslot2delays number xp+120 yp-5 w100 ,%hotbar2data%
	Gui, Add, Checkbox, x10 yp+30 vhotbar3setting %textcol% %hotbar3setting%,hotbar slot 3
	Gui, Add,Edit,vslot3delays number xp+120 yp-5 w100 ,%hotbar3data%
	Gui, Add, Checkbox, x10 yp+30 vhotbar4setting %textcol% %hotbar4setting%,hotbar slot 4
	Gui, Add,Edit,vslot4delays number xp+120 yp-5 w100,%hotbar4data%
	Gui, Add, Checkbox, x10 yp+30 vhotbar5setting %textcol% %hotbar5setting%,hotbar slot 5
	Gui, Add,Edit,vslot5delays number xp+120 yp-5 w100,%hotbar5data%
	Gui, Add, Checkbox, x10 yp+30 vhotbar6setting %textcol% %hotbar6setting%,hotbar slot 6
	Gui, Add,Edit,vslot6delays number xp+120 yp-5 w100,%hotbar6data%
	Gui, Add, Checkbox, x10 yp+30 vhotbar7setting %textcol% %hotbar7setting%,hotbar slot 7
	Gui, Add,Edit,vslot7delays number xp+120 yp-5 w100,%hotbar7data%
	Gui, Font,s9,bold
	Gui, Tab,4
	Gui, Add,GroupBox, x20 y30 w225 h210 %textcol%, general
	Gui, Add, Button, x35 y50,Reset Config File
	Gui, Add, Button, x35 y80,Join Discord
	Gui, Add, Button, x35 yp+30,Reset Timers
	Gui, Add,Text, x160 yp+35 %textcol%,main viplink
	Gui, Add,Edit, w120 h20 x35 yp-5 gprivlink1 vprivlink1 , %plink1%
	Gui, Add,Text, x160 yp+35 %textcol%,backup viplink
	Gui, Add,Edit, w120 h20 x35 yp-5 gprivlink2 vprivlink2 , %plink2%
	Gui, Add,CheckBox, vsprinktoggle x35 yp+25 %textcol% %sprinkleraligntoggle%,align to sprinkler
	
	Gui, Add,Text, xp yp+20 %textcol%,convert type :
	Gui, Font,s10,bold
	Gui, Add,DropDownlist, vconvstatus yp-5 xp+85 w70 h100,%convsetting%||None|Reset|Rejoin
	Gui, Font,s9,bold
	
	Gui, Add,GroupBox,x260 y30 w225 h210 %textcol%, extra space
	Gui, Add,Text, xp+10 yp+20 %textcol%, max time on field (minutes)
	Gui, Add, Edit, gnumberonfieldsafety yp-5 xp+160 number w40
	Gui, Add, UpDown, vmaxtimespentonfield Range1-30, %maxtimespentonfield%
	Gui, add, Text, x270 yp+35 %textcol%, keyboard type : 
	Gui, Font,s10,bold
	Gui, Add, DropDownList, xp+100 yp-5 w100 h90 gupdatekeyboard vkeyboard,%keyboardtypeee%||qwerty|azerty|qwertz
	Gui, Font,s9
	Gui, Add,Checkbox, vjumpstatus xp-100 yp+55 %jumpdata% %textcol%,jump 10s when arriving at field
	Gui, Add,Checkbox, vserverjoinstatus xp yp+20 %serverdata% %textcol%,force join main link 
	Gui, Add,Checkbox, vdrstatus xp  yp+20 %doubleresetdata% %textcol%,double reset in extras
	Gui, Add,Checkbox, vplanters xp yp+20 %planters% %textcol%,enable planters (master switch)
	Gui, Add,Checkbox, vusetool xp yp-80 %tooldata% %textcol%,swing tool while farming
	Gui, Add,Text, xp yp+100 %textcol%,character speed : 
	Gui, Add, Edit, gspeedsafety yp xp+105 number w40
	Gui, Add, UpDown, vhaststatus Range10-50, %haststatus%
	Gui, Font,s10,bold
	
	Gui, Tab,advanced
	Gui, Add,checkbox,vshutdownserv x20 y40 %shutdowndata% %textcol%, shut down the server every
	Gui, Add,Edit,vsrtime number xp+210 yp-5 w60,%shutdowntime%
	Gui, Add,Text,%textcol% xp+65 yp+5, minutes
	Gui, Add,checkbox,vssboard x20 yp+25 %textcol% %ssboarddata%,screenshot leaderboard at ///
	Gui, Add,Text,yp xp+225 %textcol%,hour :
	Gui, Add,DropDownlist,vlbsshour xp+45 yp w60 h200,%lbhourdata%||None|00|01|02|03|04|05|06|07|08|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23
	Gui, Add,Text,yp xp+70 %textcol%,/ minutes :
	Gui, Add,DropDownlist,vlbssmin xp+75 yp w60 h200,%lbmindata%||None|00|10|20|30|40|50
	Gui, Add,Text,%textcol% x20 yp+30,amount of square waves in bettertokenzigzag = 
	Gui, Add,Edit,vsquarewaves number xp+330 yp-5 w50 ,%amountofsquarewaves%
	Gui, Add,Button,w140 h30 x15 y200, customize farming
	Gui, Add,Groupbox, xp+5 yp-85 w435 h75 %textcol%, kill vicious
	Gui, Add,Checkbox, vkillvic xp+10 yp+25 %textcol% %killviccheck%,kill vicious bee when night is detected
	Gui, Add,Text,%textcol% xp yp+25,stop fighting vic if it hasn't been killed after
	Gui, Add,Edit,vfightvictime number xp+300 yp-5 w50,%fighttimedata%
	Gui, Add,Text,%textcol% xp+55 yp+5,seconds
	
	Gui, Tab,stuff
	Gui,Add,Groupbox,x20 y30 w300 h90 %textcol%,ant
	
	Gui, Add, Checkbox, xp+5 yp+20 vantpasss %textcol% %antsetting%, claim free ant pass
	Gui, Add, Checkbox, xp yp+20 vpantstatus %textcol% %antcheck%, use free pass to play ant
	Gui, Add, Checkbox, xp yp+20 vwhenplayanttoggle %textcol% %buyplayant%, buy and use ant pass every
	Gui, Add, DropDownlist, xp+215 yp vwhenplay w60 h200 ,%whenplayantdata%||30 min|1 hour|2 hours|4 hours
	Gui, Add, Text, x20 yp+35 %textcol%,mondo kill type = 
	Gui, Add, DropDownlist, xp+125 yp vmondokilltype w90 h200,%mondokilldata%||No Kill|Blessing|Loot
	Gui, Add,Checkbox,vpineconvhive x20 yp+30 %textcol% %pineconvdata%,pinetree walk convert
	
	Gui, Add,Text, x200 yp+35 %textcol%,Events webhook
	Gui, Add,Edit, w175 h20 x20 yp ghook vhookevent , %hookevent%
	Gui, Add,Text, x200 yp+35 %textcol%,Errors webhook
	Gui, Add,Edit, w175 h20 x20 yp ghook vhookerror , %hookerror%
	Gui,Add,picture,x250 y145 ,Macro Parts/Images/hotbar.png
	Gui, Add,Button,w140 h30 x330 y100,Load blue 5 nectar preset
	
	Gui, Tab,more
	Gui, Add,Text, x200 y40 %textcol%,Balloon warnings webhook
	Gui, Add,Edit, w175 h20 x20 yp ghook vhookballoon , %hookballoon%
	
	Gui, Add,GroupBox,x20 yp+30 w300 h90 %textcol%,shrine
	Gui, Add,Checkbox,vshrine x25 yp+25 %textcol% %shrine%,donate 
	Gui, Add,Edit,vdonationamount number xp+70 yp w50 ,%donationamount%
	Gui, Add,Text,xp+55 yp %textcol%,items to the windshrine
	Gui, Add,Text,x25 yp+30 %textcol%,item =
	Gui, Add,DropDownlist,vitemtodonate w100 h200 xp+50 yp,%itemtodonate%||None|Bitter|BlueBerry|BlueExt|Coconut|Enz|Glit|Glue|Gumdrop|Honeysuck|Oil|Pineap|RedExt|Straw|SunSeed|Ticket|Treat|Trop
	
	
	;fix for issue where gui location data is sometimes corrupted
	if (previousx > A_ScreenWidth){
		previousx := 100
	}if (previousx < 0){
		previousx := 100
	}if (previousy > A_ScreenHeight){
		previousy := 100
	}if (previousy < 0){
		previousy := 100
	}
	
	Gui, SHow,x%previousx% y%previousy%, Syspalk's macro v%currentversion%
	Tooltip,
	global guiloaded := true
	
}

loadplantui(){
	global openedplantui := true
	global a := 0
	loop 6{
		a++
		global b := 0
		loop 3{
			b++
			iniRead,plant%b%field%a%data,configs/previous.ini,plantdata,plant%b%field%a%
			iniRead,plant%b%key%a%data,configs/previous.ini,plantdata,plant%b%hotkey%a%
			iniRead,plant%b%delaydata,configs/previous.ini,plantdata,plant%b%harvesttime
		}
	}
	Gui, plant:Destroy
	Gui, plant:Color,Black
	Gui, plant:Font, s10 bold
	Gui, plant:Add,Text, x10 y15 %textcol%,plant 1
	Gui, plant:Add,DropDownList, xp+70 y10 w90 h200 gsaveplantui vplant1field1data,%plant1field1data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 y10 w90 h200 gsaveplantui vplant1field2data,%plant1field2data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 y10 w90 h200 gsaveplantui vplant1field3data,%plant1field3data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 y10 w90 h200 gsaveplantui vplant1field4data,%plant1field4data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 y10 w90 h200 gsaveplantui vplant1field5data,%plant1field5data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 y10 w90 h200 gsaveplantui vplant1field6data,%plant1field6data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,Text,x10 y45 %textcol%,hotkeys
	Gui, plant:Add,DropDownList, xp+70 yp-5 w90 h200 gsaveplantui vplant1key1data,%plant1key1data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant1key2data,%plant1key2data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant1key3data,%plant1key3data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant1key4data,%plant1key4data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant1key5data,%plant1key5data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant1key6data,%plant1key6data%||None|2|3|4|5|6|7
	Gui, plant:Add,Text, x10 y85 %textcol%,plant 2
	Gui, plant:Add,DropDownList, xp+70 yp-5 w90 h200 gsaveplantui vplant2field1data,%plant2field1data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2field2data,%plant2field2data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2field3data,%plant2field3data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2field4data,%plant2field4data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2field5data,%plant2field5data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2field6data,%plant2field6data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,Text,x10 y115 %textcol%,hotkeys
	Gui, plant:Add,DropDownList, xp+70 yp-5 w90 h200 gsaveplantui vplant2key1data,%plant2key1data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2key2data,%plant2key2data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2key3data,%plant2key3data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2key4data,%plant2key4data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2key5data,%plant2key5data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant2key6data,%plant2key6data%||None|2|3|4|5|6|7
	Gui, plant:Add,Text, x10 y155 %textcol%,plant 3
	Gui, plant:Add,DropDownList, xp+70 yp-5 w90 h200 gsaveplantui vplant3field1data,%plant3field1data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3field2data,%plant3field2data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3field3data,%plant3field3data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3field4data,%plant3field4data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3field5data,%plant3field5data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3field6data,%plant3field6data%||None|Bamboo|Blue Flower|Cactus|Clover|Coconut|Dandelion|Mountain|Mushroom|Pepper|Pine Tree|Pineapple|Pumpkin|Rose|Spider|Strawberry|Stump|Sunflower
	Gui, plant:Add,Text,x10 y185 %textcol%,hotkeys
	Gui, plant:Add,DropDownList, xp+70 yp-5 w90 h200 gsaveplantui vplant3key1data,%plant3key1data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3key2data,%plant3key2data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3key3data,%plant3key3data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3key4data,%plant3key4data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3key5data,%plant3key5data%||None|2|3|4|5|6|7
	Gui, plant:Add,DropDownList, xp+100 yp w90 h200 gsaveplantui vplant3key6data,%plant3key6data%||None|2|3|4|5|6|7
	Gui, plant:Show,w700 h220 x50 y25,plant cycles
}

loadbeesmasui(){
	global openedbeesmasui := true
	IniRead,samovar,configs/previous.ini,beesmas,samovar
	IniRead,candles,configs/previous.ini,beesmas,candles
	IniRead,stockings,configs/previous.ini,beesmas,stockings
	IniRead,feast,configs/previous.ini,beesmas,feast
	IniRead,ginger,configs/previous.ini,beesmas,ginger
	IniRead,lidart,configs/previous.ini,beesmas,lidart
	IniRead,cog,configs/previous.ini,beesmas,cog
	if (samovar){
		global samovar := "checked"
	}if (candles){
		global candles := "checked"
	}if (stockings){
		global stockings := "checked"
	}if (feast){
		global feast := "checked"
	}if (ginger){
		global ginger := "checked"
	}if (lidart){
		global lidart := "checked"
	}if (cog){
		global cog := "checked"
	}
	Gui, beesmas:Destroy
	Gui, beesmas:Color,Black
	Gui, beesmas:Font, s12 bold
	Gui, beesmas:Add,checkbox, vsamovar gsavebeesmasui x10 y15 %textcol% %samovar%,samovar
	Gui, beesmas:Add,checkbox, vcandles gsavebeesmasui xp yp+25 %textcol% %candles%,candles
	Gui, beesmas:Add,checkbox, vstockings gsavebeesmasui xp yp+25 %textcol% %stockings%,stockings
	Gui, beesmas:Add,checkbox, vfeast gsavebeesmasui xp yp+25 %textcol% %feast%,feast
	Gui, beesmas:Add,checkbox, vginger gsavebeesmasui xp yp+25 %textcol% %ginger%,ginger bread house
	Gui, beesmas:Add,checkbox, vlidart gsavebeesmasui xp yp+25 %textcol% %lidart%,Onett's lid art
	Gui, beesmas:Add,checkbox, vcog gsavebeesmasui xp yp+25 %textcol% %cog%,Robo pass
	loc := A_ScreenWidth - 300
	Gui, beesmas:Show,w250 h200 x%loc% y50,Beesmas
}

loadfarmui(){
	savedata()
	global openedfarmui := true
	IniRead,turnangle,configs/previous.ini,advanced,turnangle
	IniRead,pinecornerwalkdata,configs/previous.ini,advanced,pinecornerwalkdata
	IniRead,pinecornerwait,configs/previous.ini,advanced,pinecornerwait
	IniRead,pbrd,configs/previous.ini,advanced,pbrd
	IniRead,pbfd,configs/previous.ini,advanced,pbfd
	IniRead,bty,configs/previous.ini,advanced,bty
	IniRead,btx,configs/previous.ini,advanced,btx
	IniRead,dirtomovedata,configs/previous.ini,advanced,dirtomovedata
	IniRead,moveawayms,configs/previous.ini,advanced,moveawayms
	IniRead,movedata,configs/previous.ini,advanced,movedata
	IniRead,turncam,configs/previous.ini,advanced,turncam
	if (turncam){
		turncam := "checked"
	}
	if (movedata){
		movedata := "checked"
	}
	Gui, farm:Destroy
	Gui, farm:Color,Black
	Gui, farm:Font, s10 bold
	Gui, farm:Add,checkbox, vturncam gsavefarmui x20 y15 %textcol% %turncam%,turn camera
	Gui, farm:Add,DropDownList,vturnangle gsavefarmui xp+105 yp w60 h200,%turnangle%||None|45|90|135|180|225|270|315
	Gui, farm:Add,Text, yp xp+65 %textcol%,degrees to the right when landing on the field
	Gui, farm:Add,Checkbox,vmovedata gsavefarmui x20 yp+30 %movedata% %textcol%,move for 
	Gui, farm:Add,Edit,vmoveawayms gsavefarmui xp+85 yp-5 number w70,%moveawayms%
	Gui, farm:Add,text, xp+75 yp+5 %textcol%,away from start position to
	Gui, farm:Add,DropDownlist,vdirtomovedata gsavefarmui xp+185 yp w60 h300,%dirtomovedata%||None|N|NE|E|SE|S|SW|W|NW
	Gui, farm:Add,Text, x20 yp+25 %textcol%,Pine walk back from corner delay = 
	Gui, farm:Add,Edit,vpinecornerwalkdata gsavefarmui xp+250 yp-5 number w70,%pinecornerwalkdata%
	Gui, farm:Add,Text, x20 yp+30 %textcol%,Pine wait in corner delay =
	Gui, farm:Add,Edit,vpinecornerwait gsavefarmui xp+185 yp-5 number w70,%pinecornerwait%
	Gui, farm:Add,Text, x20 yp+30 %textcol%,Pine bettertokenzigzag forward multi = 
	Gui, farm:Add,Edit,vpbfd gsavefarmui x290 yp-5 w70,%pbfd%
	Gui, farm:Add,Text, x20 yp+30 %textcol%,Pine bettertokenzigzag 1st rightwalk right multi = 
	Gui, farm:Add,Edit,vpbrd x360 gsavefarmui yp-5 w70,%pbrd%
	Gui, farm:Add,Text, x20 yp+30 %textcol%,bettertokenzigzag ← / → distance = 
	Gui, farm:Add,Edit,vbtx x270 gsavefarmui yp-5 w70,%btx%
	Gui, farm:Add,Text, x20 yp+30 %textcol%,bettertokenzigzag ↑ / ↓ distance = 
	Gui, farm:Add,Edit,vbty gsavefarmui x260 yp-5 w70,%bty%
	Gui, farm:Show, w525 h230 x50 y290,custom farming options
}

popup(SizeX,SizeY,Title,Text){
	Textloc := SizeX-20
	Gui, popup:Destroy
	Gui, popup:Font,s10,Segoe UI
	Gui, popup:Add,Text, +wrap x10 y5 w%Textloc% ,%Text%
	Gui, popup:Show, w%SizeX% h%SizeY%,%Title%
}