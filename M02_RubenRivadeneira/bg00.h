
//{{BLOCK(bg00)

//======================================================================
//
//	bg00, 768x256@4, 
//	+ palette 256 entries, not compressed
//	+ 381 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x32 
//	Total size: 512 + 12192 + 6144 = 18848
//
//	Time-stamp: 2020-04-11, 12:03:31
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG00_H
#define GRIT_BG00_H

#define bg00TilesLen 12192
extern const unsigned short bg00Tiles[6096];

#define bg00MapLen 6144
extern const unsigned short bg00Map[3072];

#define bg00PalLen 512
extern const unsigned short bg00Pal[256];

#endif // GRIT_BG00_H

//}}BLOCK(bg00)
