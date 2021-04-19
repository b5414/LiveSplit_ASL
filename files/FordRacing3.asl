state("fr3"){
	int aState: "FR3.EXE", 0x1917B4, 0xBA8;
	// int aState2: "FR3.EXE", 0x1917B4, 0x90; // weird one
	// int ss1: "FR3.EXE", 0x1B1DBC; // big one
}

/* update{
	if(current.aState2 != old.aState2 || current.aState != old.aState)
		print("aaa: __: "+ old.aState +" ==> "+ current.aState +" | "+ old.aState2 +" ==> "+ current.aState2);
} */

startup{
	settings.Add("res12", false, "Reset only on entering the profile creation menu");
}

start{
	return (old.aState == 61 && (current.aState == 7 || current.aState == 2));
}

split{
	return (old.aState != 58 && current.aState == 58);
}

reset{
	return settings["res12"] ? (old.aState == 12 && current.aState == 9) : (old.aState != 12 && current.aState == 12);
}

