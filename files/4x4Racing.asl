state("4x4game"){
	int money: "java.dll", 0x0000BDD0, 0x474, 0x85C, 0x54;
	int bonus: "java.dll", 0x0000BDD0, 0x474, 0x85C, 0x58;
	
	int menuState: "chromeengine2.dll", 0x000FB4FC, 0xB28, 0xC48;
	// int menuState2: "chromeengine2.dll", 0x00026478, 0x68, 0x4E8, 0xC48;
	
	int checkPoint: "chromeengine2.dll", 0x00439634, 0xB0, 0x1C, 0x10, 0x0, 0x270, 0x10;
	// int checkPoint2: "chromeengine2.dll", 0x000962A4, 0x84, 0x88C, 0x68, 0x84, 0x270, 0x10;
}

startup{
	settings.Add("CpSplit", false, "Split for each CHECKPOINT on the map");
}

start{
	return (current.menuState == 0 && current.bonus == 0 && current.money == 0);
}

reset{
	return (current.menuState == 2 && old.menuState != 2);
}

split{
	return (current.menuState == 18 && old.menuState != 18) || (settings["CpSplit"] && (current.checkPoint == old.checkPoint+1));
}

isLoading{
	return (current.menuState == 43);
}

