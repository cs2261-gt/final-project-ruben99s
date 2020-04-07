
//{{BLOCK(bg00)

//======================================================================
//
//	bg00, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 434 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 13888 + 4096 = 18496
//
//	Time-stamp: 2020-04-06, 22:36:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG00_H
#define GRIT_BG00_H

#define bg00TilesLen 13888
extern const unsigned short bg00Tiles[6944];

#define bg00MapLen 4096
extern const unsigned short bg00Map[2048];

#define bg00PalLen 512
extern const unsigned short bg00Pal[256];

#endif // GRIT_BG00_H

//}}BLOCK(bg00)
