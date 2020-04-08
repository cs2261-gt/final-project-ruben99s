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
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBalloons.part.0, %function
drawBalloons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #4864
	ldr	r3, [r0]
	ldr	r2, [r0, #44]
	ldr	ip, .L7
	lsl	r3, r3, #23
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	add	r2, r2, #2
	lsr	r3, r3, #23
	add	r1, ip, r2, lsl #3
	orr	r3, r3, #16384
	lsl	r2, r2, #3
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [ip, r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	shadowOAM
	.size	drawBalloons.part.0, .-drawBalloons.part.0
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
	ldr	r1, .L21
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #56]
	push	{r4, r5, r6, lr}
	ldr	r0, .L21+4
	ldr	lr, [r1, #64]
	add	r2, r2, lr, lsl #5
	ldr	lr, [r0, #32]
	ldr	ip, .L21+8
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	lsl	r2, r2, #2
	cmp	lr, #0
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	blne	drawBuzz.part.0
.L10:
	ldr	r4, .L21+12
	add	r5, r4, #240
.L12:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	drawBalloons.part.0
.L11:
	add	r4, r4, #48
	cmp	r4, r5
	bne	.L12
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L21+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L21+24
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
.L22:
	.align	2
.L21:
	.word	player
	.word	enemies
	.word	shadowOAM
	.word	balloons
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
	ldr	r3, .L25
	ldr	r1, [r3]
	ldr	r3, .L25+4
	sub	r1, ip, r1
	str	r1, [r3]
	ldr	r1, .L25+8
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
.L26:
	.align	2
.L25:
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
	ldr	r4, .L49
	ldr	r3, .L49+4
	ldr	r5, [r4, #52]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #56]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #60]
	str	r1, [r4, #56]
	bne	.L28
	ldr	r0, [r4, #64]
	ldr	r3, .L49+8
	ldr	r1, [r4, #68]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #64]
.L28:
	ldr	r3, .L49+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L49+16
	streq	r3, [r2]
	ldr	r2, .L49+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #56]
	ands	r3, r3, #16
	bne	.L30
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L49+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #56]
	beq	.L31
.L32:
	ldr	r3, .L49+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L35
	ldr	r3, [r4, #56]
.L36:
	cmp	r3, #4
	bne	.L38
	mov	r3, #0
	str	r6, [r4, #56]
	str	r3, [r4, #64]
	str	r3, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	ldr	r2, .L49+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #56]
	streq	r2, [r4, #64]
	beq	.L38
	cmp	r2, #0
	bne	.L48
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #56]
	str	r3, [r4, #64]
.L38:
	add	r5, r5, #1
	str	r5, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L32
	ldr	r3, .L49+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L31
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #56]
.L33:
	mov	r3, #4
	str	r3, [r4, #64]
	b	.L32
.L31:
	mov	r3, #0
	str	r3, [r4, #56]
	b	.L33
.L48:
	mov	r2, #5
	ldr	r3, [r4, #56]
	str	r2, [r4, #64]
	b	.L36
.L50:
	.align	2
.L49:
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
	ldr	r1, .L52
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #64]
	ldr	r2, [r1, #56]
	ldr	r0, .L52+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
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
	ldr	r2, .L76
	ldr	r3, .L76+4
	ldrh	r2, [r2, #48]
	ldr	r1, [r3, #8]
	tst	r2, #16
	str	lr, [sp, #-4]!
	str	r1, [r3, #32]
	beq	.L55
	ldr	r0, .L76+8
.L56:
	ldr	r2, .L76
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L59
	ldr	r2, [r3, #8]
	cmp	r2, #0
	blt	.L59
	ldr	lr, [r3, #16]
	ldr	ip, [r0]
	sub	r2, r2, lr
	cmp	ip, #0
	str	r2, [r3, #8]
	ble	.L59
	ldr	r2, [r3]
	cmp	r2, #59
	suble	ip, ip, lr
	strle	ip, [r0]
.L59:
	ldr	r2, .L76
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #22
	movne	r2, #30
	moveq	ip, #1
	movne	r1, #0
	streq	r2, [r3, #24]
	strne	r2, [r3, #24]
	ldr	r2, .L76
	ldrh	r2, [r2, #48]
	streq	ip, [r3, #48]
	strne	r1, [r3, #48]
	streq	r1, [r3, #8]
	ldrne	r1, [r3, #8]
	tst	r2, #64
	ldr	ip, [r3, #40]
	ldr	r2, [r3, #12]
	bne	.L63
	cmp	r2, ip
	movge	ip, #1
	strge	ip, [r3, #44]
	blt	.L75
.L65:
	ldr	lr, [r3, #20]
	ldr	ip, [r3, #36]
	sub	r2, r2, lr
	cmp	r2, ip
	movle	ip, #0
	str	r2, [r3, #12]
	strle	ip, [r3, #44]
.L66:
	ldr	lr, .L76+12
	ldr	ip, [r0]
	ldr	r0, [lr]
	sub	r1, r1, ip
	sub	r2, r2, r0
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	b	animatePlayer
.L63:
	mov	lr, #0
	cmp	r2, ip
	str	lr, [r3, #44]
	bge	.L66
.L68:
	ldr	ip, [r3, #20]
	add	r2, r2, ip
	str	r2, [r3, #12]
	b	.L66
.L55:
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r2, #512
	ldr	r0, .L76+8
	bgt	.L56
	ldr	lr, .L76+16
	ldr	ip, [r0]
	ldr	r2, [r3, #16]
	cmp	ip, lr
	add	lr, r1, r2
	str	lr, [r3, #8]
	bgt	.L56
	ldr	lr, [r3]
	cmp	lr, #60
	addgt	r2, r2, ip
	strgt	r2, [r0]
	b	.L56
.L75:
	ldr	ip, [r3, #44]
	cmp	ip, #0
	bne	.L65
	b	.L68
.L77:
	.align	2
.L76:
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
	ldr	r3, .L80
	ldr	r1, [r3]
	ldr	r3, .L80+4
	sub	r1, r5, r1
	str	r1, [r3, #4]
	ldr	r1, .L80+8
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
.L81:
	.align	2
.L80:
	.word	vOff
	.word	enemies
	.word	283
	.size	initBuzz, .-initBuzz
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
	ldr	r3, .L100
	ldr	r2, [r0, #8]
	ldr	ip, [r3]
	sub	r3, r2, ip
	cmp	r3, #239
	str	lr, [sp, #-4]!
	ldr	r1, [r0, #44]
	bhi	.L85
	mov	lr, #1
	str	r3, [r0]
	str	lr, [r0, #32]
.L86:
	ldr	lr, [r0, #48]
	cmp	lr, #0
	bne	.L87
	cmp	r1, #0
	bne	.L88
	ldr	r1, [r0, #40]
	cmp	r2, r1
	ble	.L89
	ldr	r1, .L100+4
	ldr	r3, [r0, #16]
	ldr	lr, [r1]
	ldr	r1, [r0, #12]
	sub	r2, r2, r3
	sub	ip, r2, ip
	sub	r3, r1, lr
	str	r3, [r0, #4]
	str	ip, [r0]
	str	r2, [r0, #8]
.L90:
	mov	r3, #3
	str	r3, [r0, #56]
.L84:
	ldr	lr, [sp], #4
	bx	lr
.L85:
	ldr	lr, [r0, #32]
	cmp	lr, #0
	bne	.L86
.L87:
	ldr	ip, .L100+4
	ldr	r2, [r0, #12]
	ldr	ip, [ip]
	cmp	r1, #0
	sub	r2, r2, ip
	str	r3, [r0]
	str	r2, [r0, #4]
	beq	.L90
	cmp	r1, #1
	bne	.L84
	mov	r3, #2
	ldr	lr, [sp], #4
	str	r3, [r0, #56]
	bx	lr
.L88:
	cmp	r1, #1
	beq	.L91
	ldr	r1, .L100+4
	ldr	r2, [r0, #12]
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r3, [r0]
	str	r2, [r0, #4]
	ldr	lr, [sp], #4
	bx	lr
.L89:
	mov	r1, #1
	str	r1, [r0, #44]
.L91:
	ldr	r1, [r0, #36]
	cmp	r2, r1
	bge	.L93
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	str	r3, [r0, #8]
	ldr	r1, [r0, #44]
	sub	r3, r3, ip
	b	.L87
.L93:
	mov	r1, #0
	ldr	ip, .L100+4
	ldr	r2, [r0, #12]
	ldr	ip, [ip]
	sub	r2, r2, ip
	str	r3, [r0]
	str	r2, [r0, #4]
	str	r1, [r0, #44]
	b	.L90
.L101:
	.align	2
.L100:
	.word	hOff
	.word	vOff
	.size	updateBuzz, .-updateBuzz
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
	bne	.L103
	mov	r3, #3
	str	r3, [r0, #56]
	bx	lr
.L103:
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #56]
	bx	lr
	.size	animateBuzz, .-animateBuzz
	.align	2
	.global	initBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalloons, %function
initBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #16
	ldr	r9, .L111
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L111+4
	ldr	lr, .L111+8
	ldr	ip, .L111+12
	ldr	r0, [r5, #8]
	ldr	r4, [r5, #12]
	ldr	lr, [lr]
	ldr	ip, [ip]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	lr, r0, lr
	sub	ip, r4, ip
.L109:
	cmp	r2, #0
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	str	r1, [r3, #36]
	str	r0, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #40]
	str	r1, [r3, #32]
	streq	r10, [r9, #32]
	streq	r10, [r9, #40]
	streq	r2, [r3, #44]
	beq	.L107
	cmp	r2, #4
	str	r2, [r3, #44]
	beq	.L105
.L107:
	add	r2, r2, #1
	add	r3, r3, #48
	b	.L109
.L105:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	balloons
	.word	player
	.word	hOff
	.word	vOff
	.size	initBalloons, .-initBalloons
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
	ldr	r1, .L115
	ldr	ip, .L115+4
	str	r3, [r1]
	ldr	r1, .L115+8
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	bl	initPlayer
	bl	initBuzz
	pop	{r4, lr}
	b	initBalloons
.L116:
	.align	2
.L115:
	.word	vOff
	.word	hOff
	.word	direction
	.size	initGame, .-initGame
	.align	2
	.global	updateBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBalloons, %function
updateBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L127
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L137
.L127:
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
.L119:
	ldr	ip, .L139
	ldr	r1, .L139+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r3, r3, ip
	sub	r2, r2, r1
	str	r3, [r0]
	str	r2, [r0, #4]
	bx	lr
.L137:
	ldr	r2, .L139+8
	ldr	r3, [r2, #56]
	cmp	r3, #0
	beq	.L138
	cmp	r3, #1
	bne	.L127
	ldr	r3, [r2, #64]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L127
.L129:
	.word	.L131
	.word	.L132
	.word	.L130
	.word	.L131
	.word	.L130
	.word	.L128
.L138:
	ldr	r3, [r2, #64]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L127
.L123:
	.word	.L125
	.word	.L126
	.word	.L124
	.word	.L125
	.word	.L124
	.word	.L122
.L124:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #18
	sub	r2, r2, #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L125:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L130:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	sub	r3, r3, #2
	sub	r2, r2, #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L131:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L122:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #13
	add	r2, r2, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L126:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #18
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L132:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	sub	r3, r3, #2
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L128:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #3
	add	r2, r2, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L119
.L140:
	.align	2
.L139:
	.word	hOff
	.word	vOff
	.word	player
	.size	updateBalloons, .-updateBalloons
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
	ldr	r4, .L143
	bl	updatePlayer
	ldr	r0, .L143+4
	bl	updateBuzz
	mov	r0, r4
	bl	updateBalloons
	add	r0, r4, #48
	bl	updateBalloons
	add	r0, r4, #96
	bl	updateBalloons
	add	r0, r4, #144
	bl	updateBalloons
	add	r0, r4, #192
	pop	{r4, lr}
	b	updateBalloons
.L144:
	.align	2
.L143:
	.word	balloons
	.word	enemies
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBalloons, %function
drawBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	drawBalloons.part.0
	.size	drawBalloons, .-drawBalloons
	.comm	balloons,240,4
	.comm	enemies,72,4
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
