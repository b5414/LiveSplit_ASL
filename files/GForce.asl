state("gforce"){
	int lastMapBats: "GForce.exe", 0x00515750, 0x110, 0x3C, 0x1ACC;
	int mapID: "GForce.exe", 0x00512498;
	int aState: "GForce.exe", 0x00511D48;
	int aCS: "GForce.exe", 0x00512454;
	int loading: "GForce.exe", 0x00512754;
}

start{
	return (current.mapID == 0 && current.aCS == 0 && old.aCS == 1);
}

split{
	return ((current.mapID != old.mapID && current.mapID != 0) || (current.mapID == 26 && current.lastMapBats == 4 && old.lastMapBats == 3));
}

reset{
	return (current.mapID == 0 && current.aCS == 1 && old.aState == 4);
}

isLoading{
	return (current.aCS != 0 ||	 current.loading != 0);
}

