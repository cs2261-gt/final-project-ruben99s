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
	mov	r2, #4352
	mov	r5, #0
	strh	r2, [r3]	@ movhi
	strh	r5, [r3, #18]	@ movhi
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
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
	mov	r2, #67108864
	mov	r3, #96
	mov	r1, #4864
	push	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	ldr	r3, .L16
	strh	r1, [r2]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L16+4
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+12
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L16+40
	mov	r0, #3
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	hOff
	.word	DMANow
	.word	bg01Pal
	.word	6944
	.word	100679680
	.word	bg00Tiles
	.word	100724736
	.word	bg00Map
	.word	7520
	.word	bg01Tiles
	.word	100720640
	.word	bg01Map
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r1, .L20
	mov	lr, pc
	bx	r1
	ldr	r4, .L20+4
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
	mov	r3, #816
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L20+20
	mov	r0, #3
	ldr	r1, .L20+24
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L20+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	state
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
	ldr	r4, .L34
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToStart
.L32:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
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
	ldr	r1, .L38
	mov	lr, pc
	bx	r1
	ldr	r4, .L38+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L38+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L38+12
	mov	lr, pc
	bx	r4
	mov	r3, #784
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L38+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+20
	mov	r0, #3
	ldr	r1, .L38+24
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L38+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winScreenPal
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	state
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
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L43:
	.align	2
.L42:
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
	ldr	r1, .L46
	mov	lr, pc
	bx	r1
	ldr	r4, .L46+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L46+12
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L46+20
	mov	r0, #3
	ldr	r1, .L46+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L46+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
	.word	state
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
	ldr	r3, .L59
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L59+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L49:
	ldr	r3, .L59+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L57
.L50:
	ldr	r3, .L59+20
	ldr	r3, [r3, #56]
	cmp	r3, #0
	ble	.L58
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToLose
.L57:
	bl	goToWin
	b	.L50
.L56:
	bl	goToPause
	b	.L49
.L60:
	.align	2
.L59:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	remainingEnemies
	.word	player
	.size	game, .-game
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
	ldr	r1, .L64
	mov	lr, pc
	bx	r1
	ldr	r4, .L64+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L64+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L64+12
	mov	lr, pc
	bx	r4
	mov	r3, #1152
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L64+20
	mov	r0, #3
	ldr	r1, .L64+24
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L64+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionScreenPal
	.word	instructionScreenTiles
	.word	100720640
	.word	instructionScreenMap
	.word	state
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
	ldr	r4, .L78
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L67
	ldr	r2, .L78+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L76
.L67:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L77
.L66:
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	goToInstruction
.L76:
	ldr	r3, .L78+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L67
.L79:
	.align	2
.L78:
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
	ldr	r6, .L96
	ldr	r10, .L96+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L96+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L96+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L96+16
	ldr	r8, .L96+20
	ldr	r7, .L96+24
	ldr	fp, .L96+28
	ldr	r4, .L96+32
.L82:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L91
.L84:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L83
.L83:
	tst	r0, #8
	beq	.L91
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L85:
	tst	r0, #8
	beq	.L91
	ldr	r3, .L96+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L86:
	tst	r0, #8
	beq	.L91
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L87:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L88:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L89:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L82
.L91:
	mov	r0, r3
	b	.L82
.L97:
	.align	2
.L96:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	instruction.part.0
	.word	lose.part.0
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
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
