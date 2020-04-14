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
	mov	r3, #96
	mov	r2, #0
	push	{r4, lr}
	mov	r1, #67108864
	mov	lr, #1
	mov	r0, #8
	ldr	ip, .L4
	str	r3, [ip]
	ldr	ip, .L4+4
	str	r2, [ip]
	ldr	ip, .L4+8
	str	r2, [ip]
	ldr	ip, .L4+12
	str	r2, [ip]
	ldr	ip, .L4+16
	ldr	r2, .L4+20
	str	lr, [ip]
	str	r0, [r2]
	strh	r3, [r1, #18]	@ movhi
	ldr	r2, .L4+24
	strh	r3, [r1, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	numBalloons
	.word	isPlayerEnd
	.word	direction
	.word	remainingEnemies
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+4
	ldr	r6, .L44+8
	add	r5, r4, #672
.L7:
	mov	r0, r4
	add	r4, r4, #84
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L7
	ldr	r7, .L44+12
	ldr	r5, [r7, #56]
	cmp	r5, #0
	bne	.L23
	ldr	fp, .L44+16
	mov	r6, r5
	mov	r9, fp
	mov	r4, fp
	ldr	r8, .L44+20
	add	r10, fp, #380
.L10:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r10
	bne	.L10
	cmp	r6, #4
	ldr	r2, [r7, #56]
	bgt	.L24
.L12:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L38
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #76
	bne	.L12
.L24:
	mov	r5, r2
	cmp	r5, #1
	bne	.L13
.L40:
	ldr	r4, .L44+24
	ldr	r8, .L44+20
	sub	r10, r4, #380
	add	r5, r4, #380
.L15:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r5
	bne	.L15
	cmp	r6, #4
	ldr	r5, [r7, #56]
	bgt	.L13
	mov	r3, #5
.L17:
	ldr	r2, [r10, #420]
	cmp	r2, #0
	beq	.L39
	add	r3, r3, #1
	cmp	r3, #10
	add	r10, r10, #76
	bne	.L17
	cmp	r5, #2
	bne	.L18
.L41:
	ldr	r0, .L44+28
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #3
	bne	.L19
.L42:
	ldr	r0, .L44+32
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	b	.L19
.L23:
	mov	r6, #0
	ldr	r9, .L44+16
.L8:
	cmp	r5, #1
	beq	.L40
.L13:
	cmp	r5, #2
	beq	.L41
.L18:
	cmp	r5, #3
	beq	.L42
.L19:
	ldr	r4, .L44+16
	ldr	r6, .L44+36
	add	r5, r4, #912
	b	.L21
.L20:
	add	r4, r4, #76
	cmp	r5, r4
	beq	.L43
.L21:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L20
	mov	r0, r4
	add	r4, r4, #76
	mov	lr, pc
	bx	r6
	cmp	r5, r4
	bne	.L21
.L43:
	ldr	r3, [r7, #8]
	cmp	r3, #460
	movge	r2, #1
	ldrge	r3, .L44+40
	strge	r2, [r3]
	ldr	r2, [r7, #68]
	ldr	r3, .L44+44
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L38:
	mov	r1, #1
	add	r3, r5, r5, lsl #3
	add	r3, r5, r3, lsl r1
	add	r3, r9, r3, lsl #2
	mov	r5, r2
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	b	.L8
.L39:
	mov	r2, #1
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl r2
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	b	.L13
.L45:
	.align	2
.L44:
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
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r4, .L73+4
	ldr	r6, .L73+8
	add	r5, r4, #672
.L47:
	mov	r0, r4
	add	r4, r4, #84
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L47
	ldr	r4, .L73+12
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L48
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L48
	cmp	r3, #1
	beq	.L50
.L70:
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L50
	cmp	r3, #2
	beq	.L52
.L71:
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L52
	cmp	r3, #3
	beq	.L54
.L72:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	beq	.L54
.L55:
	ldr	r3, .L73+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L73+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L73+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L73+28
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
.L48:
	ldr	r5, .L73+32
	ldr	r0, .L73+36
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+40
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+44
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+48
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+52
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #1
	bne	.L70
.L50:
	ldr	r5, .L73+32
	ldr	r0, .L73+56
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+60
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+64
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+68
	mov	lr, pc
	bx	r5
	ldr	r0, .L73+72
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #2
	bne	.L71
.L52:
	ldr	r3, .L73+32
	ldr	r0, .L73+76
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #3
	bne	.L72
.L54:
	ldr	r0, .L73+80
	ldr	r3, .L73+32
	mov	lr, pc
	bx	r3
	b	.L55
.L74:
	.align	2
.L73:
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
	.comm	playerHealth,4,4
	.comm	isPlayerEnd,4,4
	.comm	numBalloons,4,4
	.comm	remainingEnemies,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
