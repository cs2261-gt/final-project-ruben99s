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
	.file	"game1.c"
	.text
	.align	2
	.global	initGame1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame1, %function
initGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r2, #1
	push	{r4, lr}
	mov	r3, #96
	mov	lr, #67108864
	mov	r4, #15
	ldr	r0, .L4
	str	ip, [r0]
	ldr	r0, .L4+4
	str	ip, [r0]
	ldr	r0, .L4+8
	str	ip, [r0]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	str	r2, [ip]
	ldr	ip, .L4+20
	str	r3, [r1]
	str	r4, [ip]
	strh	r3, [lr, #18]	@ movhi
	ldr	r4, .L4+24
	strh	r3, [lr, #22]	@ movhi
	mov	lr, pc
	bx	r4
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
	.word	numBalloons
	.word	isPlayerEndL1
	.word	hOff
	.word	direction
	.word	vOff
	.word	remainingEnemiesL1
	.word	initPlayer
	.word	initAnts
	.word	initBalloons
	.size	initGame1, .-initGame1
	.align	2
	.global	updateGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame1, %function
updateGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L43
	ldr	r4, .L43+4
	mov	r3, #1
	ldr	r1, .L43+8
	ldr	r0, .L43+12
	mov	lr, pc
	bx	r4
	ldr	r4, .L43+16
	ldr	r7, .L43+20
	add	r5, r4, #1136
	ldr	r6, .L43+12
	add	r5, r5, #4
.L7:
	mov	r0, r4
	mov	r1, r6
	add	r4, r4, #76
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L7
	ldr	r7, .L43+24
	ldr	r5, [r7, #56]
	cmp	r5, #0
	bne	.L22
	ldr	fp, .L43+28
	mov	r6, r5
	mov	r9, fp
	mov	r4, fp
	ldr	r8, .L43+32
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
	bgt	.L23
.L12:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L37
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #76
	bne	.L12
.L23:
	mov	r5, r2
	cmp	r5, #1
	bne	.L13
.L39:
	ldr	r4, .L43+36
	ldr	r8, .L43+32
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
	beq	.L38
	add	r3, r3, #1
	cmp	r3, #10
	add	r10, r10, #76
	bne	.L17
	cmp	r5, #2
	bne	.L18
.L40:
	ldr	r0, .L43+40
	ldr	r3, .L43+32
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #3
	bne	.L19
.L41:
	ldr	r0, .L43+44
	ldr	r3, .L43+32
	mov	lr, pc
	bx	r3
	b	.L19
.L22:
	mov	r6, #0
	ldr	r9, .L43+28
.L8:
	cmp	r5, #1
	beq	.L39
.L13:
	cmp	r5, #2
	beq	.L40
.L18:
	cmp	r5, #3
	beq	.L41
.L19:
	ldr	r4, .L43+28
	ldr	r6, .L43+48
	add	r5, r4, #912
	b	.L21
.L20:
	add	r4, r4, #76
	cmp	r5, r4
	beq	.L42
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
.L42:
	ldr	r3, [r7, #8]
	cmp	r3, #460
	movlt	r3, #0
	movge	r3, #1
	ldr	r1, [r7, #68]
	ldr	r0, .L43+52
	ldr	r2, .L43+56
	str	r3, [r0]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	mov	r1, #1
	add	r3, r5, r5, lsl #3
	add	r3, r5, r3, lsl r1
	add	r3, r9, r3, lsl #2
	mov	r5, r2
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	b	.L8
.L38:
	mov	r2, #1
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl r2
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	b	.L13
.L44:
	.align	2
.L43:
	.word	vOff
	.word	updatePlayer
	.word	hOff
	.word	bg00L1CollisionMapBitmap
	.word	ants
	.word	updateAnts
	.word	player
	.word	allBalloons
	.word	updateBalloons
	.word	allBalloons+380
	.word	allBalloons+760
	.word	allBalloons+836
	.word	updateHeldBalloon
	.word	isPlayerEndL1
	.word	playerHealth
	.size	updateGame1, .-updateGame1
	.align	2
	.global	drawGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame1, %function
drawGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L72
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L46
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L46
	cmp	r3, #1
	beq	.L48
.L69:
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L48
	cmp	r3, #2
	beq	.L50
.L70:
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L50
	cmp	r3, #3
	beq	.L52
.L71:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	beq	.L52
.L53:
	ldr	r4, .L72+8
	ldr	r6, .L72+12
	add	r5, r4, #1136
	add	r5, r5, #4
.L54:
	mov	r0, r4
	add	r4, r4, #76
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L54
	ldr	r3, .L72+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L72+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L72+28
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
.L46:
	ldr	r5, .L72+32
	ldr	r0, .L72+36
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+40
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+44
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+48
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+52
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #1
	bne	.L69
.L48:
	ldr	r5, .L72+32
	ldr	r0, .L72+56
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+60
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+64
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+68
	mov	lr, pc
	bx	r5
	ldr	r0, .L72+72
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #2
	bne	.L70
.L50:
	ldr	r3, .L72+32
	ldr	r0, .L72+76
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #3
	bne	.L71
.L52:
	ldr	r0, .L72+80
	ldr	r3, .L72+32
	mov	lr, pc
	bx	r3
	b	.L53
.L73:
	.align	2
.L72:
	.word	player
	.word	drawPlayer
	.word	ants
	.word	drawAnt
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
	.size	drawGame1, .-drawGame1
	.comm	remainingEnemiesL1,4,4
	.comm	playerHealth,4,4
	.comm	isPlayerEndL1,4,4
	.comm	numBalloons,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
