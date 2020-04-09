
//{{BLOCK(instructionScreen)

//======================================================================
//
//	instructionScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 72 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2304 + 2048 = 4864
//
//	Time-stamp: 2020-04-08, 23:24:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSCREEN_H
#define GRIT_INSTRUCTIONSCREEN_H

#define instructionScreenTilesLen 2304
extern const unsigned short instructionScreenTiles[1152];

#define instructionScreenMapLen 2048
extern const unsigned short instructionScreenMap[1024];

#define instructionScreenPalLen 512
extern const unsigned short instructionScreenPal[256];

#endif // GRIT_INSTRUCTIONSCREEN_H

//}}BLOCK(instructionScreen)
