state("runtime"){
	// int mapsPassed: "Runtime.exe", 0x18020C, 0xE0;
	int menuState: "Runtime.exe", 0x1801E0, 0x58, 0x2958;
	int menuReset: "Runtime.exe", 0x180204, 0x8, 0x14, 0xC;
}

init{}

update{
	// if(old.mapsPassed != current.mapsPassed)print("aaa: 1 "+ old.mapsPassed +" ==> "+ current.mapsPassed);
	// if(old.menuState != current.menuState)print("aaa: 2 "+ old.menuState +" ==> "+ current.menuState);
	// if(old.menuReset != current.menuReset)print("aaa: 3 "+ old.menuReset +" ==> "+ current.menuReset + " | "+ current.menuState);
	// print("aaa: 2 "+ old.menuState +" ==> "+ current.menuState);
	// if(old.mapsPassed + 1 == current.mapsPassed)print("aaa: split 1 RED "+ old.menuState +" ==> "+ current.menuState);
	// if(old.menuState == 0 && current.menuState == 4)print("aaa: split 2 RED "+ old.menuState +" ==> "+ current.menuState);
}

start{
	return (old.menuState == 0 && current.menuState == 3);
}

split{
	return (old.menuState == 0 && (current.menuState == 4 || current.menuState == 17 || current.menuState == 28));
}

reset{
	return (old.menuReset == 1 && current.menuReset == 0);
}

isLoading{}

