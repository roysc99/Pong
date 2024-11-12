
@{{BLOCK(paddle_bn_gfx)

@=======================================================================
@
@	paddle_bn_gfx, 16x8@4, 
@	+ palette 16 entries, not compressed
@	+ 2 tiles not compressed
@	Total size: 32 + 64 = 96
@
@	Time-stamp: 2024-11-12, 18:00:37
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global paddle_bn_gfxTiles		@ 64 unsigned chars
	.hidden paddle_bn_gfxTiles
paddle_bn_gfxTiles:
	.word 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
	.word 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF

	.section .rodata
	.align	2
	.global paddle_bn_gfxPal		@ 32 unsigned chars
	.hidden paddle_bn_gfxPal
paddle_bn_gfxPal:
	.hword 0x0000,0x0010,0x0200,0x0210,0x4000,0x4010,0x4200,0x4210
	.hword 0x6318,0x001F,0x03E0,0x03FF,0x7C00,0x7C1F,0x7FE0,0x7FFF

@}}BLOCK(paddle_bn_gfx)
