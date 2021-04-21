state("fsr"){
	int someState: "fsr.exe", 0x4B2BD8;
}

start{
	return (old.someState == 101 && current.someState == 102);
}

split{
	return ((old.someState == 103 || old.someState == 66) && current.someState == 104);
}

reset{
	return (old.someState == 74 && (current.someState == 6 || current.someState == 77));
}

isLoading{
	return (current.someState == 1 || current.someState == 101);
}

