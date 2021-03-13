state("gforce"){
	int lastMapBats: "GForce.exe", 0x00515750, 0x110, 0x3C, 0x1ACC;
	int mapID: "GForce.exe", 0x00512498;
	int aState: "GForce.exe", 0x00511D48;
}

start{
	return (current.mapID == 0 && current.aState == 1 && old.aState == 4);
}

split{
	return ((current.mapID != old.mapID) || (current.mapID == 26 && current.lastMapBats == 4 && old.lastMapBats == 3));
}

