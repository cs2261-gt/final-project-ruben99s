
//{{BLOCK(bg01)

//======================================================================
//
//	bg01, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 470 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 15040 + 4096 = 19648
//
//	Time-stamp: 2020-04-06, 22:15:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG01_H
#define GRIT_BG01_H

#define bg01TilesLen 15040
extern const unsigned short bg01Tiles[7520];

#define bg01MapLen 4096
extern const unsigned short bg01Map[2048];

#define bg01PalLen 512
extern const unsigned short bg01Pal[256];

#endif // GRIT_BG01_H

//}}BLOCK(bg01)
