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
	ldr	r2, [r0, #52]
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
	ldr	r2, [r1, #64]
	push	{r4, r5, r6, lr}
	ldr	r0, .L21+4
	ldr	lr, [r1, #72]
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
	add	r5, r4, #280
.L12:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	movne	r0, r4
	blne	drawBalloons.part.0
.L11:
	add	r4, r4, #56
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
	mov	r1, #10
	mov	ip, #212
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	lr, #2
	mov	r7, #30
	mov	r6, #20
	mov	r5, #112
	mov	r4, #4
	ldr	r3, .L25
	ldr	r0, [r3]
	ldr	r3, .L25+4
	sub	r0, r1, r0
	str	r0, [r3]
	ldr	r0, .L25+8
	ldr	r0, [r0]
	sub	r0, ip, r0
	str	r7, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #36]
	str	r4, [r3, #76]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r0, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #56]
	str	ip, [r3, #12]
	str	ip, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #72]
	str	r2, [r3, #64]
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
	ldr	r5, [r4, #60]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #64]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #68]
	str	r1, [r4, #64]
	bne	.L28
	ldr	r0, [r4, #72]
	ldr	r3, .L49+8
	ldr	r1, [r4, #76]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #72]
.L28:
	ldr	r3, .L49+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L49+16
	streq	r3, [r2]
	ldr	r2, .L49+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #64]
	ands	r3, r3, #16
	bne	.L30
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L49+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #64]
	beq	.L31
.L32:
	ldr	r3, .L49+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L35
	ldr	r3, [r4, #64]
.L36:
	cmp	r3, #4
	bne	.L38
	mov	r3, #0
	str	r6, [r4, #64]
	str	r3, [r4, #72]
	str	r3, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	ldr	r2, .L49+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #64]
	streq	r2, [r4, #72]
	beq	.L38
	cmp	r2, #0
	bne	.L48
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L38:
	add	r5, r5, #1
	str	r5, [r4, #60]
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
	streq	r3, [r4, #64]
.L33:
	mov	r3, #4
	str	r3, [r4, #72]
	b	.L32
.L31:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L33
.L48:
	mov	r2, #5
	ldr	r3, [r4, #64]
	str	r2, [r4, #72]
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
	ldr	ip, [r1, #72]
	ldr	r2, [r1, #64]
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
	mov	lr, #205
	mov	r0, #1
	mov	ip, #3
	ldr	r3, .L56
	ldr	r1, [r3]
	ldr	r3, .L56+4
	sub	r1, r5, r1
	str	r1, [r3, #4]
	ldr	r1, .L56+8
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
.L57:
	.align	2
.L56:
	.word	vOff
	.word	enemies
	.word	298
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L94
	ldr	r2, [r0, #8]
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #239
	mov	r4, r0
	sub	sp, sp, #20
	bhi	.L61
	mov	r1, #1
	str	r3, [r0]
	str	r1, [r0, #32]
.L62:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L64
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L65
	ldr	r3, [r4, #40]
	cmp	r2, r3
	ble	.L66
	ldr	r3, [r4, #16]
	sub	r2, r2, r3
	str	r2, [r4, #8]
	ldr	r6, .L94+4
.L67:
	ldr	r5, .L94+8
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	ldr	r9, .L94+12
	ldr	r10, .L94+16
	add	r7, r5, #280
.L73:
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L71
	ldr	fp, [r5, #48]
	cmp	fp, #0
	beq	.L93
.L71:
	add	r5, r5, #56
	cmp	r5, r7
	bne	.L73
	str	r0, [sp, #8]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	add	r0, r6, #8
	ldr	r3, [r6, #24]
	ldr	r2, [r6, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	movne	r3, #0
	ldr	r2, [r6, #8]
	ldr	r0, [r4, #40]
	strne	r3, [r6, #56]
	ldr	r1, [r8]
	ldr	r3, [r4, #8]
	cmp	r2, r0
	sub	r3, r3, r1
	blt	.L63
	ldr	r1, [r4, #36]
	cmp	r2, r1
	movle	r2, #1
	strle	r2, [r4, #48]
.L63:
	ldr	r1, .L94+20
	ldr	r0, [r1]
	ldr	r1, [r4, #44]
	cmp	r1, #0
	str	r3, [r4]
	moveq	r3, #3
	ldr	r2, [r4, #12]
	sub	r2, r2, r0
	str	r2, [r4, #4]
	streq	r3, [r4, #56]
	beq	.L60
	cmp	r1, #1
	moveq	r3, #2
	streq	r3, [r4, #56]
.L60:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	cmp	r3, #1
	ldr	r6, .L94+4
	bne	.L67
	ldr	r3, [r6, #8]
	cmp	r2, r3
	movlt	r3, #1
	movge	r3, #0
	str	r3, [r4, #44]
	ldr	r3, [r4, #16]
	subge	r2, r2, r3
	addlt	r2, r2, r3
	str	r2, [r4, #8]
	b	.L67
.L61:
	ldr	r1, [r0, #32]
	cmp	r1, #0
	beq	.L63
	b	.L62
.L93:
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r2, [sp]
	str	r1, [sp, #4]
	add	r0, r5, #8
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r10]
	strne	fp, [r5, #40]
	subne	r3, r3, #1
	strne	fp, [r4, #32]
	strne	r3, [r10]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	b	.L71
.L65:
	cmp	r3, #1
	beq	.L68
.L91:
	ldr	r6, .L94+4
	b	.L67
.L66:
	mov	r3, #1
	str	r3, [r4, #44]
.L68:
	ldr	r3, [r4, #36]
	cmp	r2, r3
	ldrlt	r3, [r4, #16]
	addlt	r2, r2, r3
	strlt	r2, [r4, #8]
	blt	.L91
.L69:
	mov	r3, #0
	ldr	r6, .L94+4
	str	r3, [r4, #44]
	b	.L67
.L95:
	.align	2
.L94:
	.word	hOff
	.word	player
	.word	balloons
	.word	collision
	.word	remainingEnemies
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
	bne	.L97
	mov	r3, #3
	str	r3, [r0, #56]
	bx	lr
.L97:
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
	ldr	r9, .L105
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L105+4
	ldr	ip, .L105+8
	ldr	lr, .L105+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L103:
	cmp	r2, #0
	stm	r3, {r4, lr}
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	str	r1, [r3, #44]
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #48]
	str	r1, [r3, #40]
	str	r0, [r3, #32]
	str	ip, [r3, #36]
	streq	r10, [r9, #40]
	streq	r10, [r9, #48]
	streq	r2, [r3, #52]
	beq	.L101
	cmp	r2, #4
	str	r2, [r3, #52]
	beq	.L99
.L101:
	add	r2, r2, #1
	add	r3, r3, #56
	b	.L103
.L99:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L106:
	.align	2
.L105:
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
	push	{r4, lr}
	mov	r3, #96
	mov	lr, #0
	mov	r1, #1
	mov	r2, #67108864
	ldr	ip, .L109
	ldr	r0, .L109+4
	str	r3, [ip]
	str	lr, [r0]
	ldr	ip, .L109+8
	ldr	r0, .L109+12
	str	r1, [ip]
	str	r1, [r0]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	bl	initPlayer
	bl	initBuzz
	pop	{r4, lr}
	b	initBalloons
.L110:
	.align	2
.L109:
	.word	vOff
	.word	hOff
	.word	direction
	.word	remainingEnemies
	.size	initGame, .-initGame
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
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	drawBalloons.part.0
	.size	drawBalloons, .-drawBalloons
	.align	2
	.global	animateBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBalloons, %function
animateBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L130
	ldr	r3, [r2, #64]
	cmp	r3, #0
	bne	.L114
	ldr	r3, [r2, #72]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L122
.L116:
	.word	.L118
	.word	.L119
	.word	.L117
	.word	.L118
	.word	.L117
	.word	.L115
.L114:
	cmp	r3, #1
	bne	.L122
	ldr	r3, [r2, #72]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L122
.L124:
	.word	.L126
	.word	.L127
	.word	.L125
	.word	.L126
	.word	.L125
	.word	.L123
.L122:
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
.L120:
	ldr	ip, .L130+4
	ldr	r1, .L130+8
	ldr	ip, [ip]
	ldr	r1, [r1]
	sub	r3, r3, ip
	sub	r2, r2, r1
	str	r3, [r0]
	str	r2, [r0, #4]
	bx	lr
.L118:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L117:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #18
	sub	r2, r2, #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L125:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	sub	r3, r3, #2
	sub	r2, r2, #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L126:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L119:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #18
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L115:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #13
	add	r2, r2, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L127:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	sub	r3, r3, #2
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L123:
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #3
	add	r2, r2, #16
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L120
.L131:
	.align	2
.L130:
	.word	player
	.word	hOff
	.word	vOff
	.size	animateBalloons, .-animateBalloons
	.align	2
	.global	playerAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerAttack, %function
playerAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r1, .L143
	mov	ip, r0
	mov	r3, r1
.L135:
	ldr	r2, [r3, #40]
	cmp	r2, #0
	bne	.L142
	mov	r3, #1
	rsb	r0, r0, r0, lsl #3
	add	r0, r1, r0, lsl #3
	str	r3, [r0, #40]
	str	r3, [r0, #48]
	b	animateBalloons
.L142:
	ldr	r2, [r3, #48]
	add	r0, r0, #1
	cmp	r2, #0
	strne	ip, [r3, #48]
	cmp	r0, #5
	add	r3, r3, #56
	bne	.L135
	bx	lr
.L144:
	.align	2
.L143:
	.word	balloons
	.size	playerAttack, .-playerAttack
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
	ldr	r3, .L173
	push	{r4, r5, r6, lr}
	ldr	r4, .L173+4
	ldrh	r2, [r3, #48]
	ldr	r3, [r4, #8]
	tst	r2, #16
	str	r3, [r4, #32]
	beq	.L146
	ldr	r5, .L173+8
.L147:
	ldr	r2, .L173
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L150
	ldr	r2, [r4, #8]
	cmp	r2, #0
	blt	.L150
	ldr	r0, [r4, #16]
	ldr	r1, [r5]
	sub	r2, r2, r0
	cmp	r1, #0
	str	r2, [r4, #8]
	ble	.L150
	ldr	r2, [r4]
	cmp	r2, #59
	suble	r1, r1, r0
	strle	r1, [r5]
.L150:
	ldr	r2, .L173
	ldrh	r2, [r2, #48]
	tst	r2, #128
	movne	r3, #30
	moveq	r1, #1
	moveq	r2, #22
	movne	r2, #0
	streq	r3, [r4, #8]
	strne	r3, [r4, #24]
	ldr	r3, .L173
	ldrh	r3, [r3, #48]
	streq	r1, [r4, #48]
	streq	r2, [r4, #24]
	strne	r2, [r4, #48]
	tst	r3, #64
	movne	r3, #0
	strne	r3, [r4, #44]
	bne	.L155
	ldr	r3, [r4, #40]
	ldr	r2, [r4, #12]
	cmp	r2, r3
	movge	r3, #1
	strge	r3, [r4, #44]
.L155:
	ldr	r6, .L173+12
	ldrh	r2, [r6]
	tst	r2, #1
	ldr	r3, [r4, #52]
	beq	.L172
	ldr	r1, .L173+16
	ldrh	r1, [r1]
	tst	r1, #1
	beq	.L158
.L172:
	add	r3, r3, #1
.L157:
	tst	r2, #2
	str	r3, [r4, #52]
	beq	.L160
	ldr	r3, .L173+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L161
.L160:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r3, [r4, #12]
	bne	.L162
	ldr	r2, [r4, #40]
	cmp	r3, r2
	ldrlt	r2, [r4, #20]
	addlt	r3, r3, r2
	strlt	r3, [r4, #12]
.L163:
	ldr	r1, .L173+20
	ldr	r0, [r5]
	ldr	r2, [r4, #8]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, lr}
	b	animatePlayer
.L146:
	ldr	r2, [r4, #28]
	add	r2, r3, r2
	cmp	r2, #2048
	ldr	r5, .L173+8
	bgt	.L147
	ldr	r0, .L173+24
	ldr	r1, [r5]
	ldr	r2, [r4, #16]
	cmp	r1, r0
	add	r0, r3, r2
	str	r0, [r4, #8]
	bgt	.L147
	ldr	r0, [r4]
	cmp	r0, #60
	addgt	r2, r2, r1
	strgt	r2, [r5]
	b	.L147
.L162:
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #36]
	sub	r3, r3, r1
	cmp	r3, r2
	movle	r2, #0
	str	r3, [r4, #12]
	strle	r2, [r4, #44]
	b	.L163
.L161:
	ldr	r2, .L173+28
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L160
	ldr	r3, [r2]
	cmp	r3, #239
	movls	r3, #1
	strls	r3, [r2, #48]
	b	.L160
.L158:
	cmp	r3, #14
	ble	.L172
	bl	playerAttack
	mov	r3, #1
	ldrh	r2, [r6]
	b	.L157
.L174:
	.align	2
.L173:
	.word	67109120
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	1806
	.word	enemies
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, [r0, #40]
	add	r2, r0, #8
	cmp	r3, #0
	push	{r4, lr}
	ldm	r2, {r2, r3}
	mov	r4, r0
	beq	.L176
	ldr	r1, [r0, #48]
	cmp	r1, #0
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	bne	.L186
.L177:
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L176:
	ldr	r0, .L187
	ldr	r1, .L187+4
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, lr}
	bx	lr
.L186:
	bl	animateBalloons
	ldr	r3, [r0, #48]
	cmp	r3, #0
	addne	r2, r0, #8
	ldmne	r2, {r2, r3}
	bne	.L176
.L178:
	add	r2, r0, #32
	ldm	r2, {r2, r3}
	b	.L177
.L188:
	.align	2
.L187:
	.word	hOff
	.word	vOff
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
	ldr	r4, .L191
	bl	updatePlayer
	ldr	r0, .L191+4
	bl	updateBuzz
	mov	r0, r4
	bl	updateBalloons
	add	r0, r4, #56
	bl	updateBalloons
	add	r0, r4, #112
	bl	updateBalloons
	add	r0, r4, #168
	bl	updateBalloons
	add	r0, r4, #224
	pop	{r4, lr}
	b	updateBalloons
.L192:
	.align	2
.L191:
	.word	balloons
	.word	enemies
	.size	updateGame, .-updateGame
	.comm	remainingEnemies,4,4
	.comm	balloons,280,4
	.comm	enemies,72,4
	.comm	player,80,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
