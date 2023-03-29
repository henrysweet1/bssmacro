global currentversion
FileRead,currentversion,configs/version.txt
try{
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "https://raw.githubusercontent.com/Syspalkius/bssmacro/main/syspalk%20macro/configs/version.txt", true)
	whr.Send()
	whr.WaitForResponse()
	version := whr.ResponseText
}
if (currentversion != version && version != ""){
	tooltip,
	MsgBox,52,New version,There is a new version available, would you like to download it?
	ifmsgbox,Yes
	{
		run,https://github.com/Syspalkius/bssmacro
		run,https://github.com/Syspalkius/bssmacro/archive/refs/heads/main.zip
		Exitapp
	}
}