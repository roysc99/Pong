
@{{BLOCK(ball_bn_gfx)

@=======================================================================
@
@	ball_bn_gfx, 8x8@4, 
@	+ palette 16 entries, not compressed
@	+ 1 tiles not compressed
@	Total size: 32 + 32 = 64
@
@	Time-stamp: 2024-11-10, 15:15:29
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global ball_bn_gfxTiles		@ 32 unsigned chars
	.hidden ball_bn_gfxTiles
ball_bn_gfxTiles:
	.word 0x00EEEE00,0x0EEEEEE0,0xEEEEEEEE,0xEEEEEEEE,0xEEEEEEEE,0xEEEEEEEE,0x0EEEEEE0,0x00EEEE00

	.section .rodata
	.align	2
	.global ball_bn_gfxPal		@ 32 unsigned chars
	.hidden ball_bn_gfxPal
ball_bn_gfxPal:
	.hword 0x0441,0x0C83,0x14C5,0x1CE7,0x2529,0x2D6B,0x39CE,0x4A52
	.hword 0x5294,0x5EF7,0x6739,0x6F7B,0x739C,0x7BDE,0x7FFF,0x0000

@}}BLOCK(ball_bn_gfx)
