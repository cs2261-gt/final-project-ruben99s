
//{{BLOCK(finalMainScreen)

//======================================================================
//
//	finalMainScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 257 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8224 + 2048 = 10784
//
//	Time-stamp: 2020-04-23, 19:02:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FINALMAINSCREEN_H
#define GRIT_FINALMAINSCREEN_H

#define finalMainScreenTilesLen 8224
extern const unsigned short finalMainScreenTiles[4112];

#define finalMainScreenMapLen 2048
extern const unsigned short finalMainScreenMap[1024];

#define finalMainScreenPalLen 512
extern const unsigned short finalMainScreenPal[256];

#endif // GRIT_FINALMAINSCREEN_H

//}}BLOCK(finalMainScreen)
