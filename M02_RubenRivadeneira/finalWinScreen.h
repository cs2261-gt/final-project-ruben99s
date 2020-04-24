
//{{BLOCK(finalWinScreen)

//======================================================================
//
//	finalWinScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 99 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3168 + 2048 = 5728
//
//	Time-stamp: 2020-04-23, 18:44:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FINALWINSCREEN_H
#define GRIT_FINALWINSCREEN_H

#define finalWinScreenTilesLen 3168
extern const unsigned short finalWinScreenTiles[1584];

#define finalWinScreenMapLen 2048
extern const unsigned short finalWinScreenMap[1024];

#define finalWinScreenPalLen 512
extern const unsigned short finalWinScreenPal[256];

#endif // GRIT_FINALWINSCREEN_H

//}}BLOCK(finalWinScreen)
