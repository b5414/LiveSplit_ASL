state("flatout"){
	int aChapter: "flatout.exe", 0x002A6C80, 0x1C;
	int menuState: "flatout.exe", 0x002B8154, 0x44;
	int laps: "flatout.exe", 0x002CB5C8, 0, 0x74, 0, 0x60;
	
	int goodState: "flatout.exe", 0x002B815C, 0x40; // 1 2 5
	// int goodState2: "flatout.exe", 0x002B815C, 0x44; // 4 5 8
	
	// int aChapter: "flatout.exe", 0x002A6C80, 0x2934;
	// int aSomeState: "flatout.exe", 0x002A6C80, 0x0C;
	// int aGamePause: "flatout.exe", 0x002CB5D4, 0x14;
}

init{
	vars.krace = 0;
}

startup{
	settings.Add("LapSplit", false, "Split for each LAP of the race");
	settings.Add("RowSplit", false, "Split for each ROW, 3-bronze 4-silver 5-gold (selected by unlock)");
}

start{
	if(current.menuState == 8 && old.menuState == 3 || current.menuState == 9 && old.menuState == 3){
		vars.krace = 0;
		return true;
	}
}

split{
	if(settings["LapSplit"] && old.laps + 1 == current.laps)return true;
	if(current.goodState == 2 && old.goodState == 1){
		if(!settings["RowSplit"])return true;
		vars.krace++;
		int[] chapterLength = new int[3]{3, 4, 5};
		if(vars.krace % chapterLength[current.aChapter] == 0){
			if(chapterLength[current.aChapter]*3 == vars.krace)vars.krace = 0;
			return true;
		}
	}
}

reset{
	return (current.menuState == 17 && old.menuState == 17);
}

