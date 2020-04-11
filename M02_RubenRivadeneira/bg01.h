
//{{BLOCK(bg01)

//======================================================================
//
//	bg01, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 454 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 14528 + 4096 = 19136
//
//	Time-stamp: 2020-04-11, 12:01:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG01_H
#define GRIT_BG01_H

#define bg01TilesLen 14528
extern const unsigned short bg01Tiles[7264];

#define bg01MapLen 4096
extern const unsigned short bg01Map[2048];

#define bg01PalLen 512
extern const unsigned short bg01Pal[256];

#endif // GRIT_BG01_H

//}}BLOCK(bg01)
