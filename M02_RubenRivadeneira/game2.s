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
	.file	"game2.c"
	.text
	.align	2
	.global	initGame2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r3, #96
	mov	lr, #1
	mov	ip, #67108864
	ldr	r0, .L4
	str	r2, [r0]
	ldr	r0, .L4+4
	str	r2, [r0]
	ldr	r0, .L4+8
	ldr	r1, .L4+12
	str	r2, [r0]
	ldr	r2, .L4+16
	str	r3, [r1]
	str	lr, [r2]
	strh	r3, [ip, #18]	@ movhi
	ldr	r2, .L4+20
	strh	r3, [ip, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	numBalloons
	.word	isPlayerEndL2
	.word	hOff
	.word	vOff
	.word	direction
	.word	initPlayer
	.word	initBalloons
	.size	initGame2, .-initGame2
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L42
	ldr	r2, .L42+4
	ldr	r1, .L42+8
	ldr	r0, .L42+12
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #0
	bne	.L22
	ldr	fp, .L42+20
	mov	r6, r5
	mov	r9, fp
	mov	r4, fp
	ldr	r8, .L42+24
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
	bgt	.L23
.L11:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L36
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #76
	bne	.L11
.L23:
	mov	r5, r2
	cmp	r5, #1
	bne	.L12
.L38:
	ldr	r4, .L42+28
	ldr	r8, .L42+24
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
	beq	.L37
	add	r3, r3, #1
	cmp	r3, #10
	add	r10, r10, #76
	bne	.L16
	cmp	r5, #2
	bne	.L17
.L39:
	ldr	r0, .L42+32
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r5, [r7, #56]
	cmp	r5, #3
	bne	.L18
.L40:
	ldr	r0, .L42+36
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	b	.L18
.L22:
	mov	r6, #0
	ldr	r9, .L42+20
.L7:
	cmp	r5, #1
	beq	.L38
.L12:
	cmp	r5, #2
	beq	.L39
.L17:
	cmp	r5, #3
	beq	.L40
.L18:
	ldr	r4, .L42+20
	ldr	r6, .L42+40
	add	r5, r4, #912
	b	.L20
.L19:
	add	r4, r4, #76
	cmp	r4, r5
	beq	.L41
.L20:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L19
	mov	r0, r4
	add	r4, r4, #76
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L20
.L41:
	ldr	r3, [r7, #8]
	cmp	r3, #460
	movge	r2, #1
	ldrge	r3, .L42+44
	strge	r2, [r3]
	ldr	r2, [r7, #68]
	ldr	r3, .L42+48
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	mov	r1, #1
	add	r3, r5, r5, lsl #3
	add	r3, r5, r3, lsl r1
	add	r3, r9, r3, lsl #2
	mov	r5, r2
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	b	.L7
.L37:
	mov	r2, #1
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl r2
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	b	.L12
.L43:
	.align	2
.L42:
	.word	player
	.word	vOff
	.word	hOff
	.word	bg00L2CollisionMapBitmap
	.word	updatePlayer
	.word	allBalloons
	.word	updateBalloons
	.word	allBalloons+380
	.word	allBalloons+760
	.word	allBalloons+836
	.word	updateHeldBalloon
	.word	isPlayerEndL2
	.word	playerHealth
	.size	updateGame2, .-updateGame2
	.align	2
	.global	drawGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L69
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L45
	ldr	r2, [r4, #60]
	cmp	r2, #0
	beq	.L45
	cmp	r3, #1
	beq	.L47
.L66:
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L47
	cmp	r3, #2
	beq	.L49
.L67:
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L49
	cmp	r3, #3
	beq	.L51
.L68:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	beq	.L51
.L52:
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L69+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L69+20
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
.L45:
	ldr	r5, .L69+24
	ldr	r0, .L69+28
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+32
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+36
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+40
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+44
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #1
	bne	.L66
.L47:
	ldr	r5, .L69+24
	ldr	r0, .L69+48
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+52
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+56
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+60
	mov	lr, pc
	bx	r5
	ldr	r0, .L69+64
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #56]
	cmp	r3, #2
	bne	.L67
.L49:
	ldr	r3, .L69+24
	ldr	r0, .L69+68
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #3
	bne	.L68
.L51:
	ldr	r0, .L69+72
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	b	.L52
.L70:
	.align	2
.L69:
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
	.size	drawGame2, .-drawGame2
	.comm	playerHealth,4,4
	.comm	isPlayerEndL2,4,4
	.comm	numBalloons,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
