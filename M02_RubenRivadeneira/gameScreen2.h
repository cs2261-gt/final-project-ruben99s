
//{{BLOCK(gameScreen2)

//======================================================================
//
//	gameScreen2, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2020-04-06, 19:03:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN2_H
#define GRIT_GAMESCREEN2_H

#define gameScreen2TilesLen 64
extern const unsigned short gameScreen2Tiles[32];

#define gameScreen2MapLen 2048
extern const unsigned short gameScreen2Map[1024];

#define gameScreen2PalLen 512
extern const unsigned short gameScreen2Pal[256];

#endif // GRIT_GAMESCREEN2_H

//}}BLOCK(gameScreen2)
