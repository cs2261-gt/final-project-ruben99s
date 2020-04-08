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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #10
	mov	r5, #211
	mov	lr, #32
	mov	r2, #0
	mov	r4, #4
	mov	ip, #2
	ldr	r3, .L4
	ldr	r1, .L4+4
	ldr	r0, [r3]
	ldr	r1, [r1]
	ldr	r3, .L4+8
	sub	r0, r6, r0
	sub	r1, r5, r1
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #48]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	vOff
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #96
	str	lr, [sp, #-4]!
	mov	r2, #67108864
	mov	lr, #0
	mov	r0, #1
	ldr	r1, .L8
	ldr	ip, .L8+4
	str	r3, [r1]
	ldr	r1, .L8+8
	str	lr, [ip]
	str	r0, [r1]
	ldr	lr, [sp], #4
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	b	initPlayer
.L9:
	.align	2
.L8:
	.word	vOff
	.word	hOff
	.word	direction
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L23
	ldr	r3, .L23+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L11
	ldr	r0, [r4, #44]
	ldr	r3, .L23+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L11:
	ldr	r3, .L23+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L23+16
	streq	r3, [r2]
	ldr	r3, .L23+12
	ldrh	r3, [r3, #48]
	streq	r1, [r4, #36]
	ands	r3, r3, #16
	moveq	r1, #1
	ldreq	r2, .L23+16
	streq	r3, [r4, #36]
	ldr	r3, .L23+12
	streq	r1, [r2]
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L14
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #128
	str	r2, [r4, #36]
	bne	.L16
.L17:
	mov	r3, #3
	str	r3, [r4, #36]
.L16:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L17
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L16
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.word	direction
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L31
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #36]
	ldr	r0, .L31+4
	ldrb	ip, [r1, #4]	@ zero_extendqisi2
	cmp	r2, #3
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	beq	.L29
	ldr	r3, [r1, #44]
	add	r2, r2, r3, lsl #5
	lsl	r2, r2, #2
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L29:
	ldr	r3, .L31+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L30
	cmp	r3, #0
	moveq	r3, #644
	strheq	r3, [r0, #4]	@ movhi
	bx	lr
.L30:
	mov	r3, #640
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.word	shadowOAM
	.word	direction
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L35+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L35+12
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #20]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.size	drawGame, .-drawGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	ldrh	r2, [r3, #48]
	ldr	r1, .L42+4
	ldr	r3, .L42+8
	tst	r2, #16
	str	lr, [sp, #-4]!
	ldr	r2, [r3, #8]
	ldr	r0, [r1]
	bne	.L38
	ldr	ip, [r3, #28]
	add	ip, r2, ip
	cmp	ip, #512
	ble	.L41
.L38:
	ldr	ip, .L42
	ldrh	ip, [ip, #48]
	tst	ip, #32
	bne	.L39
	cmp	r2, #0
	blt	.L39
	ldr	ip, [r3, #16]
	cmp	r0, #0
	sub	r2, r2, ip
	str	r2, [r3, #8]
	ble	.L39
	ldr	lr, [r3]
	cmp	lr, #119
	suble	r0, r0, ip
	strle	r0, [r1]
.L39:
	ldr	ip, .L42+12
	ldr	r1, [r3, #12]
	ldr	ip, [ip]
	sub	r2, r2, r0
	sub	r1, r1, ip
	ldr	lr, [sp], #4
	str	r2, [r3]
	str	r1, [r3, #4]
	b	animatePlayer
.L41:
	ldr	ip, [r3, #16]
	ldr	lr, .L42+16
	add	r2, r2, ip
	cmp	r0, lr
	str	r2, [r3, #8]
	bgt	.L38
	ldr	lr, [r3]
	cmp	lr, #120
	addgt	r0, r0, ip
	strgt	r0, [r1]
	b	.L38
.L43:
	.align	2
.L42:
	.word	67109120
	.word	hOff
	.word	player
	.word	vOff
	.word	270
	.size	updatePlayer, .-updatePlayer
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
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.comm	player,52,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
