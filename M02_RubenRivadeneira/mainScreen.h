
//{{BLOCK(mainScreen)

//======================================================================
//
//	mainScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 60 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1920 + 2048 = 4480
//
//	Time-stamp: 2020-04-08, 23:23:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINSCREEN_H
#define GRIT_MAINSCREEN_H

#define mainScreenTilesLen 1920
extern const unsigned short mainScreenTiles[960];

#define mainScreenMapLen 2048
extern const unsigned short mainScreenMap[1024];

#define mainScreenPalLen 512
extern const unsigned short mainScreenPal[256];

#endif // GRIT_MAINSCREEN_H

//}}BLOCK(mainScreen)
