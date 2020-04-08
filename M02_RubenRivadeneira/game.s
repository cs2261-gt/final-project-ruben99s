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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBuzz.part.0, %function
drawBuzz.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #56]
	ldr	r2, .L3
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	shadowOAM
	.size	drawBuzz.part.0, .-drawBuzz.part.0
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
	ldr	r1, .L11
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #56]
	push	{r4, lr}
	ldr	r0, .L11+4
	ldr	lr, [r1, #64]
	add	r2, r2, lr, lsl #5
	ldr	lr, [r0, #32]
	ldr	ip, .L11+8
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	lsl	r2, r2, #2
	cmp	lr, #0
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	blne	drawBuzz.part.0
.L6:
	ldr	r3, .L11+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L11+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L11+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L11+20
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
.L12:
	.align	2
.L11:
	.word	player
	.word	enemies
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #10
	mov	r0, #212
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	lr, #2
	mov	r7, #30
	mov	r6, #20
	mov	r5, #132
	mov	r4, #4
	ldr	r3, .L15
	ldr	r1, [r3]
	ldr	r3, .L15+4
	sub	r1, ip, r1
	str	r1, [r3]
	ldr	r1, .L15+8
	ldr	r1, [r1]
	sub	r1, r0, r1
	str	r7, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #36]
	str	r4, [r3, #68]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #4]
	str	ip, [r3, #8]
	str	ip, [r3, #32]
	str	r0, [r3, #12]
	str	r0, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #64]
	str	r2, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	hOff
	.word	player
	.word	vOff
	.size	initPlayer, .-initPlayer
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
	ldr	r4, .L39
	ldr	r3, .L39+4
	ldr	r5, [r4, #52]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #56]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #60]
	str	r1, [r4, #56]
	bne	.L18
	ldr	r0, [r4, #64]
	ldr	r3, .L39+8
	ldr	r1, [r4, #68]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #64]
.L18:
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L39+16
	streq	r3, [r2]
	ldr	r2, .L39+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #56]
	ands	r3, r3, #16
	bne	.L20
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L39+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #56]
	beq	.L21
.L22:
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L25
	ldr	r3, [r4, #56]
.L26:
	cmp	r3, #4
	bne	.L28
	mov	r3, #0
	str	r6, [r4, #56]
	str	r3, [r4, #64]
	str	r3, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r2, .L39+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #56]
	streq	r2, [r4, #64]
	beq	.L28
	cmp	r2, #0
	bne	.L38
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #56]
	str	r3, [r4, #64]
.L28:
	add	r5, r5, #1
	str	r5, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L22
	ldr	r3, .L39+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L21
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #56]
.L23:
	mov	r3, #4
	str	r3, [r4, #64]
	b	.L22
.L21:
	mov	r3, #0
	str	r3, [r4, #56]
	b	.L23
.L38:
	mov	r2, #5
	ldr	r3, [r4, #56]
	str	r2, [r4, #64]
	b	.L26
.L40:
	.align	2
.L39:
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
	ldr	r1, .L42
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #64]
	ldr	r2, [r1, #56]
	ldr	r0, .L42+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	ldr	r2, .L66
	ldr	r3, .L66+4
	ldrh	r2, [r2, #48]
	ldr	r1, [r3, #8]
	tst	r2, #16
	str	lr, [sp, #-4]!
	str	r1, [r3, #32]
	beq	.L45
	ldr	r0, .L66+8
.L46:
	ldr	r2, .L66
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L49
	ldr	r2, [r3, #8]
	cmp	r2, #0
	blt	.L49
	ldr	lr, [r3, #16]
	ldr	ip, [r0]
	sub	r2, r2, lr
	cmp	ip, #0
	str	r2, [r3, #8]
	ble	.L49
	ldr	r2, [r3]
	cmp	r2, #59
	suble	ip, ip, lr
	strle	ip, [r0]
.L49:
	ldr	r2, .L66
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #22
	movne	r2, #30
	moveq	ip, #1
	movne	r1, #0
	streq	r2, [r3, #24]
	strne	r2, [r3, #24]
	ldr	r2, .L66
	ldrh	r2, [r2, #48]
	streq	ip, [r3, #48]
	strne	r1, [r3, #48]
	streq	r1, [r3, #8]
	ldrne	r1, [r3, #8]
	tst	r2, #64
	ldr	ip, [r3, #40]
	ldr	r2, [r3, #12]
	bne	.L53
	cmp	r2, ip
	movge	ip, #1
	strge	ip, [r3, #44]
	blt	.L65
.L55:
	ldr	lr, [r3, #20]
	ldr	ip, [r3, #36]
	sub	r2, r2, lr
	cmp	r2, ip
	movle	ip, #0
	str	r2, [r3, #12]
	strle	ip, [r3, #44]
.L56:
	ldr	lr, .L66+12
	ldr	ip, [r0]
	ldr	r0, [lr]
	sub	r1, r1, ip
	sub	r2, r2, r0
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	b	animatePlayer
.L53:
	mov	lr, #0
	cmp	r2, ip
	str	lr, [r3, #44]
	bge	.L56
.L58:
	ldr	ip, [r3, #20]
	add	r2, r2, ip
	str	r2, [r3, #12]
	b	.L56
.L45:
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r2, #512
	ldr	r0, .L66+8
	bgt	.L46
	ldr	lr, .L66+16
	ldr	ip, [r0]
	ldr	r2, [r3, #16]
	cmp	ip, lr
	add	lr, r1, r2
	str	lr, [r3, #8]
	bgt	.L46
	ldr	lr, [r3]
	cmp	lr, #60
	addgt	r2, r2, ip
	strgt	r2, [r0]
	b	.L46
.L65:
	ldr	ip, [r3, #44]
	cmp	ip, #0
	bne	.L55
	b	.L58
.L67:
	.align	2
.L66:
	.word	67109120
	.word	player
	.word	hOff
	.word	vOff
	.word	270
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBuzz, %function
initBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #203
	mov	r2, #0
	mov	r7, #20
	mov	r6, #23
	mov	r4, #240
	mov	lr, #220
	mov	r0, #1
	mov	ip, #3
	ldr	r3, .L70
	ldr	r1, [r3]
	ldr	r3, .L70+4
	sub	r1, r5, r1
	str	r1, [r3, #4]
	ldr	r1, .L70+8
	str	r7, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #12]
	str	r4, [r3, #8]
	str	lr, [r3, #40]
	str	r1, [r3, #36]
	str	ip, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	str	r2, [r3, #44]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	vOff
	.word	enemies
	.word	283
	.size	initBuzz, .-initBuzz
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
	push	{r4, lr}
	mov	r2, #67108864
	mov	lr, #0
	mov	r0, #1
	ldr	r1, .L74
	ldr	ip, .L74+4
	str	r3, [r1]
	ldr	r1, .L74+8
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	bl	initPlayer
	pop	{r4, lr}
	b	initBuzz
.L75:
	.align	2
.L74:
	.word	vOff
	.word	hOff
	.word	direction
	.size	initGame, .-initGame
	.align	2
	.global	drawBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBuzz, %function
drawBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	drawBuzz.part.0
	.size	drawBuzz, .-drawBuzz
	.align	2
	.global	updateBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBuzz, %function
updateBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	ldr	r2, [r0, #8]
	ldr	ip, [r3]
	sub	r3, r2, ip
	cmp	r3, #239
	str	lr, [sp, #-4]!
	ldr	r1, [r0, #44]
	bhi	.L79
	mov	lr, #1
	str	r3, [r0]
	str	lr, [r0, #32]
.L80:
	ldr	lr, [r0, #48]
	cmp	lr, #0
	bne	.L81
	cmp	r1, #0
	bne	.L82
	ldr	r1, [r0, #40]
	cmp	r2, r1
	ble	.L83
	ldr	r1, .L94+4
	ldr	r3, [r0, #16]
	ldr	lr, [r1]
	ldr	r1, [r0, #12]
	sub	r2, r2, r3
	sub	ip, r2, ip
	sub	r3, r1, lr
	str	r3, [r0, #4]
	str	ip, [r0]
	str	r2, [r0, #8]
.L84:
	mov	r3, #3
	str	r3, [r0, #56]
.L78:
	ldr	lr, [sp], #4
	bx	lr
.L79:
	ldr	lr, [r0, #32]
	cmp	lr, #0
	bne	.L80
.L81:
	ldr	ip, .L94+4
	ldr	r2, [r0, #12]
	ldr	ip, [ip]
	cmp	r1, #0
	sub	r2, r2, ip
	str	r3, [r0]
	str	r2, [r0, #4]
	beq	.L84
	cmp	r1, #1
	bne	.L78
	mov	r3, #2
	ldr	lr, [sp], #4
	str	r3, [r0, #56]
	bx	lr
.L82:
	cmp	r1, #1
	beq	.L85
	ldr	r1, .L94+4
	ldr	r2, [r0, #12]
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r3, [r0]
	str	r2, [r0, #4]
	ldr	lr, [sp], #4
	bx	lr
.L83:
	mov	r1, #1
	str	r1, [r0, #44]
.L85:
	ldr	r1, [r0, #36]
	cmp	r2, r1
	bge	.L87
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	str	r3, [r0, #8]
	ldr	r1, [r0, #44]
	sub	r3, r3, ip
	b	.L81
.L87:
	mov	r1, #0
	ldr	ip, .L94+4
	ldr	r2, [r0, #12]
	ldr	ip, [ip]
	sub	r2, r2, ip
	str	r3, [r0]
	str	r2, [r0, #4]
	str	r1, [r0, #44]
	b	.L84
.L95:
	.align	2
.L94:
	.word	hOff
	.word	vOff
	.size	updateBuzz, .-updateBuzz
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
	push	{r4, lr}
	bl	updatePlayer
	ldr	r0, .L98
	pop	{r4, lr}
	b	updateBuzz
.L99:
	.align	2
.L98:
	.word	enemies
	.size	updateGame, .-updateGame
	.align	2
	.global	animateBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBuzz, %function
animateBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L101
	mov	r3, #3
	str	r3, [r0, #56]
	bx	lr
.L101:
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #56]
	bx	lr
	.size	animateBuzz, .-animateBuzz
	.comm	balloons,300,4
	.comm	enemies,72,4
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
