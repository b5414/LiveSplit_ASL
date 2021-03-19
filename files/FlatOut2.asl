state("flatout2"){
	int load: "FlatOut2.exe", 0x004E8444;
	// int load: "FlatOut2.exe", 0x004DA768; // 1 to 0
}

isLoading{
	return (current.load == 1);
}

