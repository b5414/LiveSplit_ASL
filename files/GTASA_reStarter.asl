state("gta_sa"){
	int version_100_EU: 0x4245BC;
	int version_100_US: 0x42457C;
	int version_101_EU: 0x42533C;
	int version_101_US: 0x4252FC;
	int version_300_Steam: 0x45EC4A;
	int version_101_Steam: 0x45DEDA;
}

state("gta-sa"){
	int version_100_EU: 0x4245BC;
	int version_100_US: 0x42457C;
	int version_101_EU: 0x42533C;
	int version_101_US: 0x4252FC;
	int version_300_Steam: 0x45EC4A;
	int version_101_Steam: 0x45DEDA;
}

init{
	var versionValue = 38079;
	int versionOffset = 0;

	int playingTimeAddr = 0x77CB84;
	int startAddr = 0x77CEDC;
	int threadAddr = 0x68B42C;
	int loadingAddr = 0x7A67A5;
	int playerPedAddr = 0x77CD98;

	int moduleSize = modules.First().ModuleMemorySize;
	if(current.version_100_EU == versionValue || current.version_100_US == versionValue || moduleSize == 18313216){
		versionOffset = 0;
		version = "1.0";
	}
	if(current.version_101_EU == versionValue || current.version_101_US == versionValue || moduleSize == 34471936){
		versionOffset = 0x2680;
		version = "1.01";
	}
	if(moduleSize == 17985536){
		versionOffset = 0x2680;
		version = "2.00";
	}
	if(current.version_300_Steam == versionValue || moduleSize == 9691136){
		versionOffset = 0x75130;
		version = "3.00 Steam";
	}
	if(current.version_101_Steam == versionValue){
		versionOffset = 0x75770;
		version = "1.01 Steam";
	}
	if(moduleSize == 9981952){
		versionOffset = 0x77970;
		version = "Steam";
		playingTimeAddr = 0x80FD74;
		startAddr = 0x810214;
		threadAddr = 0x702D98;
		loadingAddr = 0x833995;
		playerPedAddr = 0x8100D0;
	}

	int offset = versionOffset;
	if(version != "Steam"){
		playingTimeAddr += offset;
		startAddr += offset;
		threadAddr += offset;
		loadingAddr += offset;
		playerPedAddr += offset;
	}
	
	// Memory Watchers
	vars.watchers = new MemoryWatcherList();
	vars.watchers.Add(new StringWatcher(new DeepPointer(threadAddr, 0x8), 10){Name = "thread"});
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(loadingAddr)){Name = "loading"});
}

startup{
	settings.Add("res", true, "Reset on loading");
	
	settings.Add("Marker enter - trigger Start", true);
	settings.CurrentDefaultParent = "Marker enter - trigger Start";
	
	settings.Add("bad", true, "Badlands%");
	settings.Add("asf", true, "SanFierro%");
	settings.Add("des", true, "Desert%");
	settings.Add("alv", true, "LasVenturas% - Stowaway");
	settings.Add("rtl", true, "RTLS%");
}

start{
	var thread = vars.watchers["thread"];
	bool tf = (thread.Old == "noname");
	
	// badlands
	if(settings["bad"] && thread.Current == "bcrash1" && (tf || thread.Old == "camera"))return true;
	
	// san fierro
	if(settings["asf"] && thread.Current == "garag1" && (tf || thread.Old == "garage"))return true;
	
	// desert
	if(settings["des"] && thread.Current == "toreno1" && (tf || thread.Old == "zero" || thread.Old == "camera"))return true;
	
	// las venturas
	if(settings["alv"] && thread.Current == "desert9" && (tf || thread.Old == "litcas" || thread.Old == "camera"))return true;
	
	// rtls
	if(settings["rtl"] && thread.Current == "mansio2" && (tf || thread.Old == "camera"))return true;
}

update{
	// var thread = vars.watchers["thread"];
	// print("aaa: "+ thread.Current +" <== "+ thread.Old);
	vars.watchers.UpdateAll(game);
}

reset{
	var loading = vars.watchers["loading"];
	if(!loading.Current && loading.Old)return true;
}

