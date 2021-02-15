state("flatout"){
	// int aSomeState: "flatout.exe", 0x002A6C80, 0x0C;
	// int aGamePause: "flatout.exe", 0x002CB5D4, 0x14;
	
	int goodState: "flatout.exe", 0x002B815C, 0x40; // 1 2 5
	// int goodState2: "flatout.exe", 0x002B815C, 0x44; // 4 5 8
	
	int menuState: "flatout.exe", 0x002B8154, 0x44;
	int laps: "flatout.exe", 0x002CB5C8, 0, 0x74, 0, 0x60;
}

startup{
	settings.Add("Lap Split", false, "Split for each lap of the race");
}

start{
	return (current.menuState == 8 && old.menuState == 3 || current.menuState == 9 && old.menuState == 3);
}

reset{
	return (current.menuState == 17 && old.menuState == 17);
}

split{
	if(settings["Lap Split"] && old.laps + 1 == current.laps)return true;
	return (current.goodState == 2 && old.goodState == 1);
}

