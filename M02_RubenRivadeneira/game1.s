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
	push	{r4, lr}
	mov	r3, #96
	mov	lr, #67108864
	mov	r2, #1
	ldr	r0, .L4
	str	ip, [r0]
	ldr	r0, .L4+4
	str	ip, [r0]
	ldr	r0, .L4+8
	ldr	r1, .L4+12
	str	ip, [r0]
	ldr	ip, .L4+16
	str	r3, [r1]
	str	r2, [ip]
	strh	r3, [lr, #18]	@ movhi
	strh	r3, [lr, #22]	@ movhi
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
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
	.word	vOff
	.word	direction
	.word	initPlayer
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
	ldr	r7, .L41
	ldr	r2, .L41+4
	ldr	r1, .L41+8
	ldr	r0, .L41+12
	ldr	r3, .L41+16
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #0
	bne	.L21
	ldr	fp, .L41+20
	mov	r6, r5
	mov	r9, fp
	mov	r4, fp
	ldr	r8, .L41+24
	add	r10, fp, #380
.L9:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r10
	bne	.L9
	cmp	r6, #4
	ldr	r2, [r7, #56]
	bgt	.L22
.L11:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L35
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #76
	bne	.L11
.L22:
	mov	r5, r2
	cmp	r5, #1
	bne	.L12
.L37:
	ldr	r4, .L41+28
	ldr	r8, .L41+24
	sub	r10, r4, #380
	add	r5, r4, #380
.L14:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #40]
	add	r4, r4, #76
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r5
	bne	.L14
	cmp	r6, #4
	ldr	r5, [r7, #56]
	bgt	.L12
	mov	r3, #5
.L16:
	ldr	r2, [r10, #420]
	cmp	r2, #0
	beq	.L36
	add	r3, r3, #1
	cmp	r3, #10
	add	r10, r10, #76
	bne	.L16
	cmp	r5, #2
	bne	.L17
.L38:
	ldr	r0, .L41+32
	ldr	r3, .L41+24
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #3
	bne	.L18
.L39:
	ldr	r0, .L41+36
	ldr	r3, .L41+24
	mov	lr, pc
	bx	r3
	b	.L18
.L21:
	mov	r6, #0
	ldr	r9, .L41+20
.L7:
	cmp	r5, #1
	beq	.L37
.L12:
	cmp	r5, #2
	beq	.L38
.L17:
	cmp	r5, #3
	beq	.L39
.L18:
	ldr	r4, .L41+20
	ldr	r6, .L41+40
	add	r5, r4, #912
	b	.L20
.L19:
	add	r4, r4, #76
	cmp	r5, r4
	beq	.L40
.L20:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L19
	mov	r0, r4
	add	r4, r4, #76
	mov	lr, pc
	bx	r6
	cmp	r5, r4
	bne	.L20
.L40:
	ldr	r3, [r7, #8]
	cmp	r3, #460
	movlt	r3, #0
	movge	r3, #1
	ldr	r1, [r7, #68]
	ldr	r0, .L41+44
	ldr	r2, .L41+48
	str	r3, [r0]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	mov	r1, #1
	add	r3, r5, r5, lsl #3
	add	r3, r5, r3, lsl r1
	add	r3, r9, r3, lsl #2
	mov	r5, r2
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	b	.L7
.L36:
	mov	r2, #1
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl r2
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	b	.L12
.L42:
	.align	2
.L41:
	.word	player
	.word	vOff
	.word	hOff
	.word	bg00L1CollisionMapBitmap
	.word	updatePlayer
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
	ldr	r4, .L68
	ldr	r3, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L44
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L44
	cmp	r3, #1
	beq	.L46
.L65:
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L46
	cmp	r3, #2
	beq	.L48
.L66:
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L48
	cmp	r3, #3
	beq	.L50
.L67:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	beq	.L50
.L51:
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L68+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L68+20
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
.L44:
	ldr	r5, .L68+24
	ldr	r0, .L68+28
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+32
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+36
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+40
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+44
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #1
	bne	.L65
.L46:
	ldr	r5, .L68+24
	ldr	r0, .L68+48
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+52
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+56
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+60
	mov	lr, pc
	bx	r5
	ldr	r0, .L68+64
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #2
	bne	.L66
.L48:
	ldr	r3, .L68+24
	ldr	r0, .L68+68
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #3
	bne	.L67
.L50:
	ldr	r0, .L68+72
	ldr	r3, .L68+24
	mov	lr, pc
	bx	r3
	b	.L51
.L69:
	.align	2
.L68:
	.word	player
	.word	drawPlayer
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
	.comm	playerHealth,4,4
	.comm	isPlayerEndL1,4,4
	.comm	numBalloons,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
