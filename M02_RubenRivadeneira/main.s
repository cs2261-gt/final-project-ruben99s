	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L8
	mov	lr, pc
	bx	r1
	ldr	r4, .L8+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	ldr	r5, .L8+16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L8+20
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+28
	mov	r0, #3
	ldr	r1, .L8+32
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	ldr	r2, .L8+36
	cmp	r3, #7
	str	r3, [r2]
	beq	.L2
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L8+44
	ldr	r0, .L8+48
	ldr	r3, .L8+52
	mov	lr, pc
	bx	r3
.L2:
	mov	r3, #0
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	finalMainScreenPal
	.word	state
	.word	4112
	.word	finalMainScreenTiles
	.word	100720640
	.word	finalMainScreenMap
	.word	prevState
	.word	stopSound
	.word	2727936
	.word	mainSong
	.word	playSoundA
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #23552
	ldr	r1, .L12
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #8]	@ movhi
	ldr	r4, .L12+4
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #256
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	24068
	.word	DMANow
	.word	83886592
	.word	finalSpriteSheetPal
	.word	100728832
	.word	finalSpriteSheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	setupInterrupts
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L17:
	.align	2
.L16:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #96
	mov	r1, #4864
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L24
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L24+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L24+8
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L24+16
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	ldr	r5, .L24+24
	mov	r0, #3
	ldr	r3, .L24+28
	ldr	r2, .L24+32
	ldr	r1, .L24+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L24+40
	mov	r0, #3
	ldr	r1, .L24+44
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	ldr	r2, .L24+48
	cmp	r3, #4
	str	r3, [r2]
	beq	.L19
	ldr	r3, .L24+52
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L24+56
	ldr	r0, .L24+60
	ldr	r3, .L24+64
	mov	lr, pc
	bx	r3
.L19:
	mov	r3, #1
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	DMANow
	.word	bg00Pal
	.word	6096
	.word	bg00Tiles
	.word	100720640
	.word	bg00Map
	.word	state
	.word	7264
	.word	100679680
	.word	bg01Tiles
	.word	100724736
	.word	bg01Map
	.word	prevState
	.word	stopSound
	.word	2271168
	.word	game0Song
	.word	playSoundA
	.size	goToGame, .-goToGame
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #96
	mov	r1, #4864
	mov	r2, #0
	push	{r4, r5, r6, lr}
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L32
	mov	lr, pc
	bx	r3
	ldr	r4, .L32+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L32+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L32+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L32+16
	ldr	r1, .L32+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L32+24
	ldr	r1, .L32+28
	mov	lr, pc
	bx	r4
	ldr	r5, .L32+32
	mov	r0, #3
	ldr	r3, .L32+36
	ldr	r2, .L32+40
	ldr	r1, .L32+44
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L32+48
	mov	r0, #3
	ldr	r1, .L32+52
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	ldr	r2, .L32+56
	cmp	r3, #4
	str	r3, [r2]
	beq	.L27
	ldr	r3, .L32+60
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L32+64
	ldr	r0, .L32+68
	ldr	r3, .L32+72
	mov	lr, pc
	bx	r3
.L27:
	mov	r3, #2
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bg00Level1Pal
	.word	4624
	.word	bg00Level1Tiles
	.word	100720640
	.word	bg00Level1Map
	.word	state
	.word	8160
	.word	100679680
	.word	bg01Level1Tiles
	.word	100724736
	.word	bg01Level1Map
	.word	prevState
	.word	stopSound
	.word	1045440
	.word	gameSong
	.word	playSoundA
	.size	goToGame1, .-goToGame1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #96
	mov	r1, #4352
	mov	r2, #0
	push	{r4, r5, r6, lr}
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L40+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L40+12
	mov	lr, pc
	bx	r4
	ldr	r5, .L40+16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L40+20
	ldr	r1, .L40+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L40+28
	mov	r0, #3
	ldr	r1, .L40+32
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	ldr	r2, .L40+36
	cmp	r3, #4
	str	r3, [r2]
	beq	.L35
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L40+44
	ldr	r0, .L40+48
	ldr	r3, .L40+52
	mov	lr, pc
	bx	r3
.L35:
	mov	r3, #3
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bg00Level2Pal
	.word	state
	.word	14864
	.word	bg00Level2Tiles
	.word	100720640
	.word	bg00Level2Map
	.word	prevState
	.word	stopSound
	.word	881783
	.word	calmGame2
	.word	playSoundA
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L44
	mov	lr, pc
	bx	r1
	ldr	r4, .L44+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L44+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L44+12
	mov	lr, pc
	bx	r4
	mov	r3, #1936
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L44+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L44+20
	ldr	r1, .L44+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r1, .L44+28
	ldr	r0, .L44+32
	ldr	r3, .L44+36
	mov	lr, pc
	bx	r3
	mov	r0, #4
	ldr	r3, .L44+40
	ldr	r2, .L44+44
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L45:
	.align	2
.L44:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	finalPauseScreenPal
	.word	finalPauseScreenTiles
	.word	100720640
	.word	finalPauseScreenMap
	.word	1289664
	.word	pauseSong
	.word	playSoundB
	.word	state
	.word	prevState
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L62
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L62+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L58
.L47:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L59
.L46:
	pop	{r4, lr}
	bx	lr
.L59:
	pop	{r4, lr}
	b	goToStart
.L58:
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L60
	cmp	r3, #2
	beq	.L61
	bl	goToGame2
	ldrh	r3, [r4]
	b	.L47
.L61:
	bl	goToGame1
	ldrh	r3, [r4]
	b	.L47
.L60:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L47
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
	.word	unPauseSoundA
	.word	prevState
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L66
	mov	lr, pc
	bx	r1
	ldr	r4, .L66+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	r3, #1584
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+20
	ldr	r1, .L66+24
	mov	lr, pc
	bx	r4
	mov	r0, #5
	ldr	r3, .L66+28
	ldr	r2, .L66+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	finalWinScreenPal
	.word	finalWinScreenTiles
	.word	100720640
	.word	finalWinScreenMap
	.word	state
	.word	prevState
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L71:
	.align	2
.L70:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L74
	mov	lr, pc
	bx	r1
	ldr	r4, .L74+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L74+12
	mov	lr, pc
	bx	r4
	mov	r3, #768
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L74+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L74+20
	ldr	r1, .L74+24
	mov	lr, pc
	bx	r4
	mov	r0, #6
	ldr	r3, .L74+28
	ldr	r2, .L74+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L75:
	.align	2
.L74:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	finalLoseScreenPal
	.word	finalLoseScreenTiles
	.word	100720640
	.word	finalLoseScreenMap
	.word	state
	.word	prevState
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
	ldr	r3, .L90+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L77:
	ldr	r3, .L90+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L88
.L78:
	ldr	r3, .L90+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L89
.L76:
	pop	{r4, lr}
	bx	lr
.L88:
	ldr	r3, .L90+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L78
	ldr	r3, .L90+28
	mov	lr, pc
	bx	r3
	bl	goToGame1
	ldr	r3, .L90+20
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L76
.L89:
	pop	{r4, lr}
	b	goToLose
.L87:
	ldr	r3, .L90+32
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L77
.L91:
	.align	2
.L90:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	remainingEnemies
	.word	playerHealth
	.word	isPlayerEnd
	.word	initGame1
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L106
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L106+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L103
.L93:
	ldr	r3, .L106+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L94
	ldr	r3, .L106+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L104
.L94:
	ldr	r3, .L106+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L105
	pop	{r4, lr}
	bx	lr
.L105:
	pop	{r4, lr}
	b	goToLose
.L103:
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L93
.L104:
	ldr	r3, .L106+32
	mov	lr, pc
	bx	r3
	bl	goToGame2
	b	.L94
.L107:
	.align	2
.L106:
	.word	updateGame1
	.word	drawGame1
	.word	oldButtons
	.word	buttons
	.word	isPlayerEndL1
	.word	remainingEnemiesL1
	.word	playerHealth
	.word	pauseSound
	.word	initGame2
	.size	game1, .-game1
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L122
	mov	lr, pc
	bx	r3
	ldr	r3, .L122+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L122+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L109
	ldr	r3, .L122+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L119
.L109:
	ldr	r3, .L122+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L110
	ldr	r3, .L122+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L120
.L110:
	ldr	r3, .L122+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L121
	pop	{r4, lr}
	bx	lr
.L121:
	pop	{r4, lr}
	b	goToLose
.L119:
	ldr	r3, .L122+28
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L109
.L120:
	bl	goToWin
	b	.L110
.L123:
	.align	2
.L122:
	.word	updateGame2
	.word	drawGame2
	.word	oldButtons
	.word	buttons
	.word	isPlayerEndL2
	.word	remainingEnemiesL2
	.word	playerHealth
	.word	pauseSound
	.size	game2, .-game2
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #4352
	ldr	r1, .L127
	push	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	ldr	r0, .L127+4
	ldr	r4, .L127+8
	str	r3, [r1, #4]
	str	r3, [r1]
	mov	lr, pc
	bx	r0
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L127+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L127+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L127+20
	ldr	r1, .L127+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L127+28
	ldr	r1, .L127+32
	mov	lr, pc
	bx	r4
	mov	r0, #7
	ldr	r3, .L127+36
	ldr	r2, .L127+40
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L128:
	.align	2
.L127:
	.word	.LANCHOR0
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	FinalInstructionScreenPal
	.word	5616
	.word	FinalInstructionScreenTiles
	.word	100720640
	.word	FinalInstructionScreenMap
	.word	state
	.word	prevState
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L141
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L130
	ldr	r2, .L141+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L139
.L130:
	tst	r3, #4
	beq	.L129
	ldr	r3, .L141+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L140
.L129:
	pop	{r4, lr}
	bx	lr
.L140:
	pop	{r4, lr}
	b	goToInstruction
.L139:
	ldr	r3, .L141+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L130
.L142:
	.align	2
.L141:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L152
	ldrh	r3, [r3, #48]
	ands	r3, r3, #8
	push	{r4, lr}
	ldr	r4, .L152+4
	beq	.L150
.L144:
	ldr	r3, .L152
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L145
	ldr	r3, [r4, #4]
	cmp	r3, #95
	addle	r3, r3, #1
	strle	r3, [r4, #4]
.L145:
	ldr	r3, .L152
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L146
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
.L146:
	ldr	r3, .L152
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L147
	ldr	r3, [r4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4]
.L147:
	ldr	r3, .L152
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L148
	ldr	r3, [r4]
	cmp	r3, #15
	addle	r3, r3, #1
	strle	r3, [r4]
.L148:
	ldr	r3, .L152+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r4, #4]
	ldrh	r2, [r4]
	strh	r1, [r3, #18]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L150:
	str	r3, [r4, #4]
	str	r3, [r4]
	bl	goToStart
	b	.L144
.L153:
	.align	2
.L152:
	.word	67109120
	.word	.LANCHOR0
	.word	waitForVBlank
	.size	instruction, .-instruction
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L171
	ldr	r7, .L171+4
	ldr	r3, .L171+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L171+12
	ldr	r2, [r6]
	ldrh	r0, [r7]
	ldr	fp, .L171+16
	ldr	r10, .L171+20
	ldr	r9, .L171+24
	ldr	r8, .L171+28
	ldr	r4, .L171+32
.L156:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L167
.L158:
	.word	.L165
	.word	.L164
	.word	.L163
	.word	.L162
	.word	.L161
	.word	.L160
	.word	.L159
	.word	.L157
.L157:
	ldr	r3, .L171+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L159:
	tst	r0, #8
	beq	.L167
	ldr	r3, .L171+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L160:
	tst	r0, #8
	beq	.L167
	ldr	r3, .L171+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L161:
	ldr	r3, .L171+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L162:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L163:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L164:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L165:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L156
.L167:
	mov	r0, r3
	b	.L156
.L172:
	.align	2
.L171:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	game1
	.word	game2
	.word	67109120
	.word	instruction
	.word	lose.part.0
	.word	win.part.0
	.word	pause
	.size	main, .-main
	.global	vOffInstruction
	.global	hOffInstruction
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	prevState,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOffInstruction, %object
	.size	hOffInstruction, 4
hOffInstruction:
	.space	4
	.type	vOffInstruction, %object
	.size	vOffInstruction, 4
vOffInstruction:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
