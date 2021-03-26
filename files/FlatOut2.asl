state("flatout2"){
	int laps: "FlatOut2.exe", 0x002B21F8, 0x488;
	int load: "FlatOut2.exe", 0x004E8444;
	
	int soyState: "FlatOut2.exe", 0x004DA70C;
	int menuState: "FlatOut2.exe", 0x0029D8EC;
	int gpState: "FlatOut2.exe", 0x004E8410, 0x91C;
}

init{
	vars.lastSplit = 2000;
}

startup{
	settings.Add("LapsSplit", false, "Split for each LAPs of the race");
	settings.Add("RaceSplit", false, "Split before (and after, by def.) each RACE");
}

start{
	return (current.soyState == 8 && old.soyState == 9 && (old.menuState > 63));
}

split{
	if(settings["RaceSplit"] && (current.gpState == 8 && old.gpState == 7))return true;
	if((settings["LapsSplit"] && (current.laps == old.laps+1)) || (current.gpState == 9 && old.gpState != 9)){
		if(Environment.TickCount - vars.lastSplit > 1500){
			vars.lastSplit = Environment.TickCount;
			return true;
		}
	};
}

reset{
	return ((current.soyState == 9 && old.soyState == 8) &&
		(current.menuState == 61 && old.menuState == 59) ||
		(current.menuState == 62 && old.menuState == 60));
}

isLoading{
	return (current.load == 1);
}

