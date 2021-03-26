MAPS PASSED: "FlatOut2.exe"+004E8410
+1EF0
// finish + exit to main menu then +1

// ~~~

STATE: "FlatOut2.exe"+004E8410
+91c
// 0 menu
// 6 "start race" on start/spawn
// 7 starting...
// 8 gameplay
// 9 finish or exit

// ~~~

STATE2: "FlatOut2.exe"+002B21F8
+69c
// 3 finish + start
// 0 other + gameplay

// ~~~

laps:
"FlatOut2.exe"+004DA5D0
8
0
44

// ~~~

if(current.gpState != old.gpState)print("aaa: ps: "+current.preState+" <<< "+old.preState+ " | gp: "+current.gpState+" <<< "+old.gpState);
int load2: "FlatOut2.exe", 0x004DA768; // 1 to 0
int mapsPassed: "FlatOut2.exe", 0x004E8410, 0x1EE0;
int preState: "FlatOut2.exe", 0x002B21F8, 0x69C;

int laps2: "FlatOut2.exe", 0x00296DC8, 0x44, 0x488;
int laps2: "FlatOut2.exe", 0x002D6D48, 0x40, 0x488;
