
//{{BLOCK(mainScreen)

//======================================================================
//
//	mainScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2020-04-06, 18:20:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINSCREEN_H
#define GRIT_MAINSCREEN_H

#define mainScreenTilesLen 64
extern const unsigned short mainScreenTiles[32];

#define mainScreenMapLen 2048
extern const unsigned short mainScreenMap[1024];

#define mainScreenPalLen 512
extern const unsigned short mainScreenPal[256];

#endif // GRIT_MAINSCREEN_H

//}}BLOCK(mainScreen)
