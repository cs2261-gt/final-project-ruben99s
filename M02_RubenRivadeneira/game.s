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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	mov	r5, #1
	mov	r3, #96
	mov	ip, #67108864
	mov	r4, #13
	ldr	lr, .L4
	str	r2, [lr]
	ldr	lr, .L4+4
	ldr	r0, .L4+8
	str	r2, [lr]
	ldr	lr, .L4+12
	str	r2, [r0]
	str	r5, [lr]
	ldr	r1, .L4+16
	ldr	lr, .L4+20
	ldr	r0, .L4+24
	str	r4, [lr]
	str	r3, [r1]
	str	r2, [r0]
	ldr	r4, .L4+28
	strh	r3, [ip, #18]	@ movhi
	strh	r3, [ip, #22]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	numBalloons
	.word	secondWaveHappened
	.word	isPlayerEnd
	.word	direction
	.word	vOff
	.word	remainingEnemies
	.word	hOff
	.word	initPlayer
	.word	initBuzz
	.word	initBalloons
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L47
	ldr	r3, [r3]
	cmp	r3, #5
	bgt	.L7
	ldr	r1, .L47+4
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L40
.L7:
	ldr	r2, .L47+8
	ldr	r1, .L47+12
	ldr	r0, .L47+16
	ldr	r3, .L47+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L47+24
	ldr	r6, .L47+28
	add	r5, r4, #1088
	add	r5, r5, #4
.L8:
	mov	r0, r4
	add	r4, r4, #84
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L8
	ldr	r7, .L47+32
	ldr	r5, [r7, #56]
	cmp	r5, #0
	bne	.L23
	ldr	fp, .L47+36
	mov	r6, r5
	mov	r9, fp
	mov	r4, fp
	ldr	r8, .L47+40
	add	r10, fp, #380
.L11:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r10
	bne	.L11
	cmp	r6, #4
	ldr	r2, [r7, #56]
	bgt	.L24
.L13:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L41
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #76
	bne	.L13
.L24:
	mov	r5, r2
	cmp	r5, #1
	bne	.L14
.L43:
	ldr	r4, .L47+44
	ldr	r8, .L47+40
	sub	r10, r4, #380
	add	r5, r4, #380
.L16:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r5
	bne	.L16
	cmp	r6, #4
	ldr	r5, [r7, #56]
	bgt	.L14
	mov	r3, #5
.L18:
	ldr	r2, [r10, #420]
	cmp	r2, #0
	beq	.L42
	add	r3, r3, #1
	cmp	r3, #10
	add	r10, r10, #76
	bne	.L18
	cmp	r5, #2
	bne	.L19
.L44:
	ldr	r0, .L47+48
	ldr	r3, .L47+40
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #3
	bne	.L20
.L45:
	ldr	r0, .L47+52
	ldr	r3, .L47+40
	mov	lr, pc
	bx	r3
	b	.L20
.L23:
	mov	r6, #0
	ldr	r9, .L47+36
.L9:
	cmp	r5, #1
	beq	.L43
.L14:
	cmp	r5, #2
	beq	.L44
.L19:
	cmp	r5, #3
	beq	.L45
.L20:
	ldr	r4, .L47+36
	ldr	r6, .L47+56
	add	r5, r4, #912
	b	.L22
.L21:
	add	r4, r4, #76
	cmp	r4, r5
	beq	.L46
.L22:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L21
	mov	r0, r4
	add	r4, r4, #76
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L22
.L46:
	ldr	r3, [r7, #8]
	cmp	r3, #460
	movlt	r3, #0
	movge	r3, #1
	ldr	r1, [r7, #68]
	ldr	r0, .L47+60
	ldr	r2, .L47+64
	str	r3, [r0]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L40:
	mov	r3, #1
	ldr	r2, .L47+24
	str	r3, [r1]
	str	r3, [r2, #704]
	str	r3, [r2, #788]
	str	r3, [r2, #872]
	str	r3, [r2, #956]
	str	r3, [r2, #1040]
	b	.L7
.L41:
	mov	r1, #1
	add	r3, r5, r5, lsl #3
	add	r3, r5, r3, lsl r1
	add	r3, r9, r3, lsl #2
	mov	r5, r2
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	b	.L9
.L42:
	mov	r2, #1
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl r2
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	b	.L14
.L48:
	.align	2
.L47:
	.word	remainingEnemies
	.word	secondWaveHappened
	.word	vOff
	.word	hOff
	.word	bg00CollisionMapBitmap
	.word	updatePlayer
	.word	bees
	.word	updateBuzz
	.word	player
	.word	allBalloons
	.word	updateBalloons
	.word	allBalloons+380
	.word	allBalloons+760
	.word	allBalloons+836
	.word	updateHeldBalloon
	.word	isPlayerEnd
	.word	playerHealth
	.size	updateGame, .-updateGame
	.align	2
	.global	activateSecondWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateSecondWave, %function
activateSecondWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L50
	str	r2, [r3, #704]
	str	r2, [r3, #788]
	str	r2, [r3, #872]
	str	r2, [r3, #956]
	str	r2, [r3, #1040]
	bx	lr
.L51:
	.align	2
.L50:
	.word	bees
	.size	activateSecondWave, .-activateSecondWave
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+4
	ldr	r6, .L79+8
	add	r5, r4, #1088
	add	r5, r5, #4
.L53:
	mov	r0, r4
	add	r4, r4, #84
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L53
	ldr	r4, .L79+12
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L54
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L54
	cmp	r3, #1
	beq	.L56
.L76:
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L56
	cmp	r3, #2
	beq	.L58
.L77:
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L58
	cmp	r3, #3
	beq	.L60
.L78:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	beq	.L60
.L61:
	ldr	r3, .L79+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L79+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L79+28
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r3, [r1, #20]	@ movhi
	bx	lr
.L54:
	ldr	r5, .L79+32
	ldr	r0, .L79+36
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+40
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+44
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+48
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+52
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #1
	bne	.L76
.L56:
	ldr	r5, .L79+32
	ldr	r0, .L79+56
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+60
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+64
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+68
	mov	lr, pc
	bx	r5
	ldr	r0, .L79+72
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #2
	bne	.L77
.L58:
	ldr	r3, .L79+32
	ldr	r0, .L79+76
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #3
	bne	.L78
.L60:
	ldr	r0, .L79+80
	ldr	r3, .L79+32
	mov	lr, pc
	bx	r3
	b	.L61
.L80:
	.align	2
.L79:
	.word	drawPlayer
	.word	bees
	.word	drawBuzz
	.word	player
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	drawBalloons
	.word	allBalloons
	.word	allBalloons+76
	.word	allBalloons+152
	.word	allBalloons+228
	.word	allBalloons+304
	.word	allBalloons+380
	.word	allBalloons+456
	.word	allBalloons+532
	.word	allBalloons+608
	.word	allBalloons+684
	.word	allBalloons+760
	.word	allBalloons+836
	.size	drawGame, .-drawGame
	.comm	secondWaveHappened,4,4
	.comm	playerHealth,4,4
	.comm	isPlayerEnd,4,4
	.comm	numBalloons,4,4
	.comm	remainingEnemies,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
