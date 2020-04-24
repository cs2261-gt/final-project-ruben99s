
//{{BLOCK(finalLoseScreen)

//======================================================================
//
//	finalLoseScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 48 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1536 + 2048 = 4096
//
//	Time-stamp: 2020-04-23, 18:43:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FINALLOSESCREEN_H
#define GRIT_FINALLOSESCREEN_H

#define finalLoseScreenTilesLen 1536
extern const unsigned short finalLoseScreenTiles[768];

#define finalLoseScreenMapLen 2048
extern const unsigned short finalLoseScreenMap[1024];

#define finalLoseScreenPalLen 512
extern const unsigned short finalLoseScreenPal[256];

#endif // GRIT_FINALLOSESCREEN_H

//}}BLOCK(finalLoseScreen)
