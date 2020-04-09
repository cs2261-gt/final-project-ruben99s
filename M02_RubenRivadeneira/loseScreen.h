
//{{BLOCK(loseScreen)

//======================================================================
//
//	loseScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 50 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1600 + 2048 = 4160
//
//	Time-stamp: 2020-04-08, 23:25:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCREEN_H
#define GRIT_LOSESCREEN_H

#define loseScreenTilesLen 1600
extern const unsigned short loseScreenTiles[800];

#define loseScreenMapLen 2048
extern const unsigned short loseScreenMap[1024];

#define loseScreenPalLen 512
extern const unsigned short loseScreenPal[256];

#endif // GRIT_LOSESCREEN_H

//}}BLOCK(loseScreen)
