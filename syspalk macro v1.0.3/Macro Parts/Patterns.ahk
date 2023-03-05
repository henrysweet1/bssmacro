custombettertokenzigzag(var77){ ;nerd pattern stuff idk pretty cool
	IniRead,bty,configs/previous.ini,advanced,bty
	IniRead,btx,configs/previous.ini,advanced,btx
	GuiControlGet,squarewaves
	returnsize := btzigx*(2*squarewaves)
	if (var77 = true){
		if (tier = 1 || tier = 2 || tier = 3){
			IniRead,rmulti,configs/previous.ini,advanced,pbrd
			IniRead,forwardmulti,configs/previous.ini,advanced,pbfd
			sidewayssizez := btx*rmulti
			forwardsize := bty*forwardmulti
		}else{
			sidewayssizez := btx*0.36
			forwardsize := bty*1.1
		}
	}else{
		sidewayssizez := btzigx
		forwardsize := bty
	}
	loop %squarewaves%{
		walk(sidewayssizez,"r")
		walk(forwardsize,"f")
		walk(btx,"r")
		walk(bty,"b")
	}
	walk(returnsize,"l")
	walk(bty,"f")
	loop %squarewaves%{
		walk(btx,"r")
		walk(bty,"b")
		walk(btx,"r")
		walk(forwardsize,"f")
	}
	walk(returnsize,"l")
	walk(bty,"b")
}

zigzag(far,var77){ ;for some reason people call this snake even though snakes don't even move in this pattern in real life unless they are mentally insane
	short := far/6
	if (var77 = true){
		2a8bc := far*1.1
	}else{
		2a8bc := far
	}loop 2{
		walk(2a8bc,"f")
		walk(short,"r")
		walk(far,"b")
		walk(short,"r")
	}loop 2{
		walk(far,"f")
		walk(short,"l")
		walk(far,"b")
		walk(short,"l")
	}
}

bettertokenzigzag(variablename,var77){ ;this thing is the same as zigzag but better for token collectoin cause it moves to the part on the path where you haven't been for the longest amount of time
	sidewayssize := variablename/5
	returnsize := sidewayssize*4
	if (var77 = true){
		sidewayssizez := sidewayssize*0.36
		forwardsize := variablename*1.1
	}else{
		sidewayssizez := sidewayssize
		forwardsize := variablename
	}
	loop 2{
		walk(sidewayssizez,"r")
		walk(forwardsize,"f")
		walk(sidewayssize,"r")
		walk(variablename,"b")
	}
	walk(returnsize,"l")
	walk(variablename,"f")
	loop 2{
		walk(sidewayssize,"r")
		walk(variablename,"b")
		walk(sidewayssize,"r")
		walk(variablename,"f")
	}
	walk(returnsize,"l")
	walk(variablename,"b")
}

squares(size,var77){ ;idk why anyone would use this but look it's coded pretty nicely
	x := size
	loop 3{
		if (var77 = true){
			forward := size*1.1
		}else{
			forward := size
		}
		walk(forward,"f")
		walk(size,"r")
		walk(size,"b")
		walk(size,"l")
		size := size + x
	}
} 

patern(var1,var2,var77){ ;function that calls a function yes i know i went too far with the function spamming
	GuiControlGet,usetool
	if(var1 = "zigzag"){
		if(var2 = "None"){
			var2 := "medium"
		}if(var2 = "small"){
			var2 := 400
		}if(var2 = "medium"){
			var2 := 600
		}if(var2 = "large"){
			var2 := 800
		}
		mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
		if (usetool){
			Send {Click Left Down}
		}
		zigzag(var2,var77)
		Send {Click Left UP}
		return
	}else if(var1 = "squares"){
		if(var2 = "None"){
			var2 := "medium"
		}if(var2 = "small"){
			var2 := 100
		}if(var2 = "medium"){
			var2 := 200
		}if(var2 = "large"){
			var2 := 300
		}
		mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
		if (usetool){
			Send {Click Left Down}
		}
		squares(var2,var77)
		Send {Click Left UP}
		return
	}
	if(var1 = "bettertokenzigzag"){
		if(var2 = "None"){
			var2 := "medium"
		}if(var2 = "small"){
			var2 := 400
		}if(var2 = "medium"){
			var2 := 600
		}if(var2 = "large"){
			var2 := 800
		}
		mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
		if (usetool){
			Send {Click Left Down}
		}
		bettertokenzigzag(var2,var77)
		Send {Click Left UP}
		return
	}
	if (tier = 3 || tier = 2 || tier = 1){
		if(var1 = "custombettertokenzigzag"){
			mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
			if (usetool){
				Send {Click Left Down}
			}
			custombettertokenzigzag(var77)
			Send {Click Left Up}
			return
		}
	}
	if(var1 = "None"){
		mouseMove,A_ScreenWidth/2,A_ScreenHeight/2
		if (usetool){
			Send {Click Left Down}
		}
		sleep 10000
		Send {Click Left UP}
	}
}