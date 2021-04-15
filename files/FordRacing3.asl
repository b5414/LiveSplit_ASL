state("fr3"){
	// in dev.ing;
}

update{
	if(current.aState != old.aState || current.aState != old.aState)
		print("aaa: __: "+ old.aState +" ==> "+ current.aState +" | "+ old.aState +" ==> "+ current.aState);
}

start{
	// return (old.aState == 101001010101 && current.aState == 101001010101);
}

split{
	// return (old.aState == 101001010101 && current.aState == 101001010101);
}

reset{
	// return (old.aState == 101001010101 && current.aState == 101001010101);
}

isLoading{
	// return (current.aState == 101001010101 || current.aState == 101001010101);
}


