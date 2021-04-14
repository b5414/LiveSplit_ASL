state("fordorr"){
	int aState: "FordORR.exe", 0x6C56B4;
	// if(current.aState != old.aState)print("aaa: up: "+ old.aState +" ==> "+ current.aState);
}

start{
	return (old.aState == 103 && current.aState == 105);
}

split{
	return (old.aState == 106 && (current.aState == 107 || current.aState == 110));
}

reset{
	return (old.aState == 75 && current.aState == 6);
}

isLoading{
	return (current.aState == 103 || current.aState == 110);
}

