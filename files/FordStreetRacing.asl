state("fsr"){
	int someState: "fsr.exe", 0x4B2BD8;
}

start{
	return (old.someState == 101 && current.someState == 102);
}

split{
	return (old.someState == 103 && current.someState == 104);
}

reset{
	return (old.someState == 64 && current.someState == 74);
}

isLoading{
	return (current.someState == 1 || current.someState == 101);
}

