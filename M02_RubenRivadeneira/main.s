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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #0
	mov	r2, #4352
	strh	r5, [r3, #18]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r5, [r3, #16]	@ movhi
	ldr	r2, .L4
	mov	lr, pc
	bx	r2
	ldr	r4, .L4+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #960
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	mainScreenPal
	.word	mainScreenTiles
	.word	100720640
	.word	mainScreenMap
	.word	state
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
	ldr	r1, .L8
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #8]	@ movhi
	ldr	r4, .L8+4
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #256
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	24068
	.word	DMANow
	.word	83886592
	.word	finalSpriteSheetPal
	.word	100728832
	.word	finalSpriteSheetTiles
	.word	hideSprites
	.word	shadowOAM
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
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	instruction.part.0,win.part.0
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
	push	{r4, lr}
	ldr	r4, .L16
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+24
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+36
	ldr	r1, .L16+40
	mov	lr, pc
	bx	r4
	mov	r0, #1
	ldr	r3, .L16+44
	ldr	r2, .L16+48
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	bg00Pal
	.word	6096
	.word	bg00Tiles
	.word	100720640
	.word	bg00Map
	.word	7264
	.word	100679680
	.word	bg01Tiles
	.word	100724736
	.word	bg01Map
	.word	state
	.word	prevState
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
	push	{r4, lr}
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L20
	ldr	r4, .L20+4
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L20+16
	ldr	r1, .L20+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L20+24
	ldr	r1, .L20+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L20+32
	ldr	r2, .L20+36
	ldr	r1, .L20+40
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L20+44
	ldr	r1, .L20+48
	mov	lr, pc
	bx	r4
	mov	r0, #2
	ldr	r3, .L20+52
	ldr	r2, .L20+56
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L21:
	.align	2
.L20:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bg00Level1Pal
	.word	4624
	.word	bg00Level1Tiles
	.word	100720640
	.word	bg00Level1Map
	.word	8160
	.word	100679680
	.word	bg01Level1Tiles
	.word	100724736
	.word	bg01Level1Map
	.word	state
	.word	prevState
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
	push	{r4, lr}
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L24+16
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L24+24
	ldr	r1, .L24+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L24+32
	ldr	r2, .L24+36
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L25:
	.align	2
.L24:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	bg00Level2Pal
	.word	14864
	.word	bg00Level2Tiles
	.word	100720640
	.word	bg00Level2Map
	.word	state
	.word	prevState
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
	ldr	r1, .L28
	mov	lr, pc
	bx	r1
	ldr	r4, .L28+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L28+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L28+12
	mov	lr, pc
	bx	r4
	mov	r3, #816
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L28+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L28+20
	ldr	r1, .L28+24
	mov	lr, pc
	bx	r4
	mov	r0, #4
	ldr	r3, .L28+28
	ldr	r2, .L28+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L29:
	.align	2
.L28:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
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
	ldr	r4, .L46
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L31
	ldr	r2, .L46+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L42
.L31:
	tst	r3, #4
	beq	.L30
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L43
.L30:
	pop	{r4, lr}
	bx	lr
.L42:
	ldr	r3, .L46+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L44
	cmp	r3, #2
	beq	.L45
	bl	goToGame2
	ldrh	r3, [r4]
	b	.L31
.L43:
	pop	{r4, lr}
	b	goToStart
.L44:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L31
.L45:
	bl	goToGame1
	ldrh	r3, [r4]
	b	.L31
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	buttons
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
	ldr	r1, .L50
	mov	lr, pc
	bx	r1
	ldr	r4, .L50+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L50+12
	mov	lr, pc
	bx	r4
	mov	r3, #784
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L50+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L50+20
	ldr	r1, .L50+24
	mov	lr, pc
	bx	r4
	mov	r0, #5
	ldr	r3, .L50+28
	ldr	r2, .L50+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L51:
	.align	2
.L50:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winScreenPal
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
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
	ldr	r3, .L54
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L55:
	.align	2
.L54:
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
	ldr	r1, .L58
	mov	lr, pc
	bx	r1
	ldr	r4, .L58+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L58+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L58+12
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L58+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L58+20
	ldr	r1, .L58+24
	mov	lr, pc
	bx	r4
	mov	r0, #6
	ldr	r3, .L58+28
	ldr	r2, .L58+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L59:
	.align	2
.L58:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
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
	ldr	r3, .L74
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L74+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
.L61:
	ldr	r3, .L74+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L72
.L62:
	ldr	r3, .L74+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L73
.L60:
	pop	{r4, lr}
	bx	lr
.L72:
	ldr	r3, .L74+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L62
	ldr	r3, .L74+28
	mov	lr, pc
	bx	r3
	bl	goToGame1
	ldr	r3, .L74+20
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L60
.L73:
	pop	{r4, lr}
	b	goToLose
.L71:
	bl	goToPause
	b	.L61
.L75:
	.align	2
.L74:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	remainingEnemies
	.word	playerHealth
	.word	isPlayerEnd
	.word	initGame1
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
	ldr	r3, .L95
	ldr	r4, .L95+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L77
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L77:
	ldr	r3, .L95+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L92
	ldr	r3, .L95+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L93
.L79:
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L76
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L94
.L76:
	pop	{r4, lr}
	bx	lr
.L92:
	ldr	r3, .L95+24
	mov	lr, pc
	bx	r3
	bl	goToGame2
	ldr	r3, .L95+20
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L79
.L93:
	bl	goToLose
	b	.L79
.L94:
	pop	{r4, lr}
	b	goToLose
.L91:
	bl	goToPause
	b	.L77
.L96:
	.align	2
.L95:
	.word	updateGame1
	.word	oldButtons
	.word	drawGame1
	.word	buttons
	.word	isPlayerEndL1
	.word	playerHealth
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
	ldr	r3, .L116
	ldr	r4, .L116+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L98
	ldr	r3, .L116+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L112
.L98:
	ldr	r3, .L116+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L113
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L114
.L100:
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L97
	ldr	r3, .L116+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L115
.L97:
	pop	{r4, lr}
	bx	lr
.L113:
	bl	goToWin
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L100
.L114:
	bl	goToLose
	b	.L100
.L115:
	pop	{r4, lr}
	b	goToLose
.L112:
	bl	goToPause
	b	.L98
.L117:
	.align	2
.L116:
	.word	updateGame2
	.word	oldButtons
	.word	drawGame2
	.word	buttons
	.word	isPlayerEndL2
	.word	playerHealth
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
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L121
	mov	lr, pc
	bx	r1
	ldr	r4, .L121+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L121+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L121+12
	mov	lr, pc
	bx	r4
	mov	r3, #1152
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L121+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L121+20
	ldr	r1, .L121+24
	mov	lr, pc
	bx	r4
	mov	r0, #7
	ldr	r3, .L121+28
	ldr	r2, .L121+32
	ldr	r1, [r3]
	pop	{r4, lr}
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L122:
	.align	2
.L121:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionScreenPal
	.word	instructionScreenTiles
	.word	100720640
	.word	instructionScreenMap
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
	ldr	r4, .L135
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L124
	ldr	r2, .L135+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L133
.L124:
	tst	r3, #4
	beq	.L123
	ldr	r3, .L135+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L134
.L123:
	pop	{r4, lr}
	bx	lr
.L134:
	pop	{r4, lr}
	b	goToInstruction
.L133:
	ldr	r3, .L135+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L124
.L136:
	.align	2
.L135:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
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
	ldr	r6, .L155
	ldr	r7, .L155+4
	ldr	r3, .L155+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L155+12
	ldr	r2, [r6]
	ldrh	r0, [r7]
	ldr	fp, .L155+16
	ldr	r10, .L155+20
	ldr	r9, .L155+24
	ldr	r8, .L155+28
	ldr	r4, .L155+32
.L139:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L150
.L141:
	.word	.L148
	.word	.L147
	.word	.L146
	.word	.L145
	.word	.L144
	.word	.L143
	.word	.L142
	.word	.L140
.L140:
	tst	r0, #8
	beq	.L150
	ldr	r3, .L155+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L142:
	tst	r0, #8
	beq	.L150
	ldr	r3, .L155+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L143:
	tst	r0, #8
	beq	.L150
	ldr	r3, .L155+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L144:
	ldr	r3, .L155+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L145:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L146:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L147:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L148:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L139
.L150:
	mov	r0, r3
	b	.L139
.L156:
	.align	2
.L155:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	game1
	.word	game2
	.word	67109120
	.word	instruction.part.0
	.word	lose.part.0
	.word	win.part.0
	.word	pause
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	win
	.size	instruction, .-instruction
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	prevState,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
