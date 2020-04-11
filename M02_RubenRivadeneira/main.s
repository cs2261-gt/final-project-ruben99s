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
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+28
	ldr	r2, .L16+32
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
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L49+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	ldr	r3, .L49+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L48
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToWin
.L47:
	bl	goToPause
	b	.L41
.L50:
	.align	2
.L49:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	remainingEnemies
	.size	game, .-game
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
	ldr	r3, .L53
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L54:
	.align	2
.L53:
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
	ldr	r1, .L57
	mov	lr, pc
	bx	r1
	ldr	r4, .L57+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L57+20
	mov	r0, #3
	ldr	r1, .L57+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L57+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r1, .L62
	mov	lr, pc
	bx	r1
	ldr	r4, .L62+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L62+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r4
	mov	r3, #1152
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L62+20
	mov	r0, #3
	ldr	r1, .L62+24
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L62+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	r4, .L76
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L65
	ldr	r2, .L76+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L74
.L65:
	tst	r3, #4
	beq	.L64
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L75
.L64:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToInstruction
.L74:
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L65
.L77:
	.align	2
.L76:
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
	ldr	r6, .L94
	ldr	r10, .L94+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L94+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L94+16
	ldr	r8, .L94+20
	ldr	r7, .L94+24
	ldr	fp, .L94+28
	ldr	r4, .L94+32
.L80:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L89
.L82:
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
.L81:
	tst	r0, #8
	beq	.L89
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L83:
	tst	r0, #8
	beq	.L89
	ldr	r3, .L94+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L84:
	tst	r0, #8
	beq	.L89
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L85:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L86:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L87:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L89:
	mov	r0, r3
	b	.L80
.L95:
	.align	2
.L94:
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
