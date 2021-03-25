state("helltaker"){
	int mapsPassed: "mono-2.0-bdwgc.dll", 0x492DA8, 0xB0, 0xE78, 0x10, 0xC0;
	int menuState: "UnityPlayer.dll", 0x163B000;
	int someState: "mono-2.0-bdwgc.dll", 0x49AC08;
}

init{
	vars.oofset = 0;
}

start{
	return (current.menuState == 28+vars.oofset && old.menuState == 30+vars.oofset);
}

split{
	if(vars.oofset == 0 && current.mapsPassed > 0)vars.oofset = 1;
	return (current.someState < 50 && old.someState > 50 && old.mapsPassed == 0 && current.menuState == 21+vars.oofset);
}

reset{
	return (current.someState == 18 && current.menuState == 27+vars.oofset && old.menuState == 21+vars.oofset);
}

isLoading{
	return (current.menuState == 21 || current.menuState == 22);
}

