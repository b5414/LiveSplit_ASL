state("fr2"){
	int menuState: "fr2.exe", 0x12C450, 0xB98;
	// int someGPState: "fr2.exe", 0x3933A0, 0x84, 0x4, 0x44;
}

/* update{
	if(current.menuState != old.menuState || current.someGPState != old.someGPState){
		bool g = (current.menuState == 38);
		print("aaa: __: "+ old.menuState +" ==> "+ current.menuState +" | "+ old.someGPState +" ==> "+ current.someGPState +" | "+ g);
	}
} */

start{
	return (old.menuState == 41 && (current.menuState == 2 || current.menuState == 3));
}

split{
	return (current.menuState == 38 && old.menuState != 38);
}

reset{
	return (old.menuState == 5 && current.menuState == 8);
}

