start{
	int off = (current.mapsPassed == 0) ? 0 : 1;
	return (current.menuState == 28+off && old.menuState == 30+off);
	
	return (current.mapsPassed == 0) ? (current.menuState == 28 && old.menuState == 30) : (current.menuState == 29 && old.menuState == 31);
}

split{
	if(vars.oofset == 0 && current.mapsPassed > 0)vars.oofset = 1;
	return (current.someState < 50 && old.someState > 50 && old.mapsPassed == 0 && current.menuState == 22);
	
	// no return ((current.mapsPassed == old.mapsPassed+1) || (current.menuState == 37 && old.menuState == 35));
	// no return ((current.menuState == 36 && 36 != old.menuState) || false);
	print("aaa: up: "+ current.someState +" | "+ current.menuState +" | "+ current.mapsPassed +" <== "+ old.mapsPassed + " _"+(current.mapsPassed));
}

split{
	if(current.mapsPassed != old.mapsPassed)print("aaa: up: "+ current.someState +" | "+ current.menuState +" | "+ current.mapsPassed +" <== "+ old.mapsPassed);
	return (current.mapsPassed > 2) ? (current.mapsPassed == old.mapsPassed+1) : (current.menuState == 36 && 36 != old.menuState);
	return (current.mapsPassed <= 1) ? (current.menuState == 31 && 35 == old.menuState) : (current.mapsPassed == old.mapsPassed+1);
	return current.someState+50 < old.someState;
	
	/* also no:
	int a = old.someState;
	if(a < 50){}else if(a < 400){
		return ((current.someState > 50) && (current.mapsPassed == old.mapsPassed+1));
	}else{
		return (current.someState < 100);
	} */
	
	// bool g = old.someState > 50 && current.someState < 100 && old.mapsPassed == 0 && current.mapsPassed != old.mapsPassed;
	// if(g)print("aaa: up: "+ current.someState +" | "+ current.menuState +" | "+ current.mapsPassed +" <== "+ old.mapsPassed  +" .. "+ g);
	// return (current.mapsPassed > 0 && (current.someState == 18 || current.someState == 19 || current.someState == 16) && (current.menuState == 22 && old.menuState == 32));
	
	bool g = (current.someState < 50)
		&& (old.someState > 50)// && (old.someState < 600)
		&& (old.mapsPassed == 0)
		&& (current.menuState == 22);
	print("aaa: up: "+ current.someState +" | "+ current.mapsPassed +" | "+ current.menuState +" <== "+ old.menuState +" .. "+ g);
	return g; // no
}

reset{
	// 27 21
	bool g = (current.someState == 18 && current.menuState == 27+vars.oofset && old.menuState == 21+vars.oofset);
	if(current.menuState != old.menuState)print("aaa: ms: "+ current.someState +" | "+ current.menuState +" <== "+ old.menuState +" .. "+ g + vars.oofset);
	// (current.someState == 20 && current.menuState == 28 && old.menuState == 29) start
	// (current.someState == 18 && current.menuState == 28 && old.menuState == 22) Norm
	// (current.someState == 18 && current.menuState == 27 && old.menuState == 21) New game plus
	
	// no:
	// if((current.menuState == 21 || current.menuState == 22 || current.menuState == 32) && old.menuState != current.menuState)print("aaa: pause >"+ current.menuState);
	if(current.menuState != old.menuState)print("aaa: ms "+ current.menuState +" <<< "+ old.menuState);
}

isLoading{
	return (current.menuState == 21 || current.menuState == 22);
	
	// info:
	return (
		true &&
		current.menuState != 36 && // Success menu
		current.menuState != 35 &&
		current.menuState != 34 &&
		current.menuState != 33 &&
		true &&
		current.menuState != 31 &&
		current.menuState != 29 &&
		current.menuState != 28 &&
		true &&
		current.menuState != 27 &&
		true
	);
	// current.menuState == 21 || // Reset loading probably
	// current.menuState == 22 || // Wait loading menu
}

