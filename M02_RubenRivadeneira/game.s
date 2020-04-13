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
	.type	drawBalloons.part.0, %function
drawBalloons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #768
	ldr	r3, [r0]
	ldr	r2, [r0, #52]
	ldr	ip, .L4
	lsl	r3, r3, #23
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	add	r2, r2, #10
	lsr	r3, r3, #23
	add	r1, ip, r2, lsl #3
	orr	r3, r3, #16384
	lsl	r2, r2, #3
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [ip, r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawBalloons.part.0, .-drawBalloons.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldBalloon.part.0, %function
updateHeldBalloon.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L7
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L6
.L9:
	.word	.L11
	.word	.L12
	.word	.L10
	.word	.L11
	.word	.L10
	.word	.L8
.L14:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #3
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
.L6:
	bx	lr
.L7:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L6
.L15:
	.word	.L17
	.word	.L18
	.word	.L16
	.word	.L17
	.word	.L16
	.word	.L14
.L10:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L11:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #16
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L16:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L17:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L12:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #18
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L8:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #13
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L18:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r3, r2, #2
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.size	updateHeldBalloon.part.0, .-updateHeldBalloon.part.0
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
	ldr	r1, .L28
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #512
	ldr	r0, [r1, #72]
	ldr	r2, [r1, #64]
	ldr	r5, .L28+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, r0, lsl #5
	lsl	r2, r2, #2
	ldr	r4, .L28+8
	strh	r3, [r5, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	ldr	r0, .L28+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+20
	mov	lr, pc
	bx	r4
	ldr	r4, .L28+24
	add	r6, r4, #280
.L25:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L23
	mov	r0, r4
	bl	drawBalloons.part.0
.L24:
	add	r4, r4, #56
	cmp	r6, r4
	bne	.L25
	ldr	r3, .L28+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L28+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L28+36
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r1, #20]	@ movhi
	bx	lr
.L23:
	ldr	r3, [r4, #52]
	add	r3, r5, r3, lsl #3
	strh	r7, [r3, #80]	@ movhi
	b	.L24
.L29:
	.align	2
.L28:
	.word	player
	.word	shadowOAM
	.word	drawBuzz
	.word	bees
	.word	bees+80
	.word	bees+160
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
	ldr	r3, .L32
	ldr	r0, [r3]
	ldr	r3, .L32+4
	sub	r0, r1, r0
	str	r0, [r3]
	ldr	r0, .L32+8
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
.L33:
	.align	2
.L32:
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
	ldr	r4, .L56
	ldr	r3, .L56+4
	ldr	r5, [r4, #60]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #64]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #68]
	str	r1, [r4, #64]
	bne	.L35
	ldr	r0, [r4, #72]
	ldr	r3, .L56+8
	ldr	r1, [r4, #76]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #72]
.L35:
	ldr	r3, .L56+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L56+16
	streq	r3, [r2]
	ldr	r2, .L56+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #64]
	ands	r3, r3, #16
	bne	.L37
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L56+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #64]
	beq	.L38
.L39:
	ldr	r3, .L56+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L42
	ldr	r3, [r4, #64]
.L43:
	cmp	r3, #4
	bne	.L45
	mov	r3, #0
	str	r6, [r4, #64]
	str	r3, [r4, #72]
	str	r3, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	ldr	r2, .L56+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #64]
	streq	r2, [r4, #72]
	beq	.L45
	cmp	r2, #0
	bne	.L55
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L45:
	add	r5, r5, #1
	str	r5, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L39
	ldr	r3, .L56+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L38
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #64]
.L40:
	mov	r3, #4
	str	r3, [r4, #72]
	b	.L39
.L38:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L40
.L55:
	mov	r2, #5
	ldr	r3, [r4, #64]
	str	r2, [r4, #72]
	b	.L43
.L57:
	.align	2
.L56:
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
	ldr	r1, .L59
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #72]
	ldr	r2, [r1, #64]
	ldr	r0, .L59+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	r2, .L106
	ldr	r3, .L106+4
	ldrh	r2, [r2, #48]
	ldr	r1, [r3, #8]
	tst	r2, #16
	push	{r4, r5, r6, r7, lr}
	str	r1, [r3, #32]
	beq	.L62
	ldr	r5, .L106+8
.L63:
	ldr	r2, .L106
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L66
	ldr	r2, [r3, #8]
	cmp	r2, #0
	blt	.L66
	ldr	ip, [r3, #16]
	ldr	r0, [r5]
	sub	r2, r2, ip
	cmp	r0, #0
	str	r2, [r3, #8]
	ble	.L66
	ldr	r2, [r3]
	cmp	r2, #59
	suble	r0, r0, ip
	strle	r0, [r5]
.L66:
	ldr	r2, .L106
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #22
	movne	r2, #30
	movne	r1, #0
	moveq	r0, #1
	streq	r2, [r3, #24]
	strne	r2, [r3, #24]
	ldr	r2, .L106
	ldrh	r2, [r2, #48]
	strne	r1, [r3, #48]
	streq	r1, [r3, #8]
	streq	r0, [r3, #48]
	ldrne	r1, [r3, #8]
	tst	r2, #64
	ldr	r2, [r3, #12]
	bne	.L70
	ldr	r0, [r3, #40]
	cmp	r0, r2
	movle	r4, #1
	ldrgt	r4, [r3, #44]
	strle	r4, [r3, #44]
.L72:
	ldr	r0, .L106+12
	ldrh	lr, [r0]
	tst	lr, #1
	ldr	r0, [r3, #52]
	beq	.L103
	ldr	ip, .L106+16
	ldrh	ip, [ip]
	ands	ip, ip, #1
	beq	.L75
.L103:
	add	r0, r0, #1
.L74:
	tst	lr, #2
	str	r0, [r3, #52]
	beq	.L83
	ldr	r0, .L106+16
	ldrh	r0, [r0]
	tst	r0, #2
	bne	.L83
	mov	r6, #1
	ldr	r0, .L106+20
	add	lr, r0, #240
.L85:
	ldr	ip, [r0, #32]
	cmp	ip, #0
	beq	.L84
	ldr	ip, [r0]
	cmp	ip, #239
	strls	r6, [r0, #52]
.L84:
	add	r0, r0, #80
	cmp	r0, lr
	bne	.L85
.L83:
	cmp	r4, #0
	bne	.L104
	ldr	r0, [r3, #40]
	cmp	r0, r2
	ldrgt	r0, [r3, #20]
	addgt	r2, r2, r0
	strgt	r2, [r3, #12]
.L86:
	ldr	r0, .L106+24
	ldr	ip, [r5]
	ldr	r0, [r0]
	sub	r1, r1, ip
	sub	r2, r2, r0
	pop	{r4, r5, r6, r7, lr}
	stm	r3, {r1, r2}
	b	animatePlayer
.L70:
	mov	r0, #0
	mov	r4, r0
	str	r0, [r3, #44]
	b	.L72
.L62:
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r2, #512
	ldr	r5, .L106+8
	bgt	.L63
	ldr	ip, .L106+28
	ldr	r0, [r5]
	ldr	r2, [r3, #16]
	cmp	r0, ip
	add	ip, r1, r2
	str	ip, [r3, #8]
	bgt	.L63
	ldr	ip, [r3]
	cmp	ip, #60
	addgt	r2, r2, r0
	strgt	r2, [r5]
	b	.L63
.L104:
	ldr	ip, [r3, #20]
	ldr	r0, [r3, #36]
	sub	r2, r2, ip
	cmp	r2, r0
	movle	r0, #0
	str	r2, [r3, #12]
	strle	r0, [r3, #44]
	b	.L86
.L75:
	cmp	r0, #9
	ble	.L103
	ldr	r7, .L106+32
	mov	r0, ip
	mov	ip, r7
.L79:
	ldr	r6, [ip, #40]
	cmp	r6, #0
	beq	.L77
	ldr	r6, [ip, #48]
	cmp	r6, #0
	bne	.L105
.L77:
	add	r0, r0, #1
	cmp	r0, #5
	add	ip, ip, #56
	bne	.L79
.L78:
	mov	r0, #1
	b	.L74
.L105:
	mov	ip, #0
	rsb	r0, r0, r0, lsl #3
	add	r0, r7, r0, lsl #3
	str	ip, [r0, #48]
	b	.L78
.L107:
	.align	2
.L106:
	.word	67109120
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	vOff
	.word	270
	.word	balloons
	.size	updatePlayer, .-updatePlayer
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
	ldr	r0, .L120
	mov	r2, #0
	mov	r3, r0
.L111:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L109
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L119
.L109:
	add	r2, r2, #1
	cmp	r2, #5
	add	r3, r3, #56
	bne	.L111
	bx	lr
.L119:
	mov	r3, #0
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	str	r3, [r2, #48]
	bx	lr
.L121:
	.align	2
.L120:
	.word	balloons
	.size	playerAttack, .-playerAttack
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
	ldr	r9, .L128
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L128+4
	ldr	ip, .L128+8
	ldr	lr, .L128+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L126:
	cmp	r2, #0
	stm	r3, {r4, lr}
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	str	r1, [r3, #44]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #48]
	str	r1, [r3, #40]
	str	r2, [r3, #52]
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #32]
	str	ip, [r3, #36]
	streq	r10, [r9, #40]
	streq	r10, [r9, #48]
	beq	.L124
	cmp	r2, #4
	beq	.L122
.L124:
	add	r2, r2, #1
	add	r3, r3, #56
	b	.L126
.L122:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L129:
	.align	2
.L128:
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
	mov	r1, #0
	push	{r4, lr}
	mov	r2, #67108864
	mov	lr, #1
	mov	r0, #3
	ldr	ip, .L132
	str	r3, [ip]
	ldr	ip, .L132+4
	str	r1, [ip]
	ldr	ip, .L132+8
	str	r1, [ip]
	ldr	ip, .L132+12
	ldr	r1, .L132+16
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	bl	initPlayer
	ldr	r3, .L132+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	initBalloons
.L133:
	.align	2
.L132:
	.word	vOff
	.word	hOff
	.word	numBalloons
	.word	direction
	.word	remainingEnemies
	.word	initBuzz
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
	ldr	r3, [r0, #40]
	cmp	r3, #0
	push	{r4, lr}
	mov	r4, r0
	beq	.L142
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L137
	mov	r1, #0
	ldr	r2, .L143
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L136
.L137:
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	beq	.L136
	bl	updateHeldBalloon.part.0
.L142:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
.L136:
	ldr	r0, .L143+4
	ldr	r1, .L143+8
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r3, r3, r0
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	player
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
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	ldr	r4, .L158
	ldr	r0, .L158+4
	mov	lr, pc
	bx	r4
	ldr	r5, .L158+8
	ldr	r0, .L158+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L158+16
	mov	lr, pc
	bx	r4
	mov	r8, r5
	mov	r4, r5
	mov	r6, #0
	add	r7, r5, #280
.L147:
	mov	r0, r4
	bl	updateBalloons
	ldr	r3, [r4, #40]
	add	r4, r4, #56
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r7, r4
	bne	.L147
	cmp	r6, #4
	bgt	.L145
	mov	r3, #0
.L150:
	ldr	r2, [r5, #40]
	cmp	r2, #0
	beq	.L157
	add	r3, r3, #1
	cmp	r3, #5
	add	r5, r5, #56
	bne	.L150
.L145:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #3
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	updateBuzz
	.word	bees
	.word	balloons
	.word	bees+80
	.word	bees+160
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
	ldr	r2, [r0, #40]
	cmp	r2, #0
	bne	drawBalloons.part.0
.L161:
	mov	r2, #512
	ldr	r1, [r0, #52]
	ldr	r3, .L162
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #80]	@ movhi
	bx	lr
.L163:
	.align	2
.L162:
	.word	shadowOAM
	.size	drawBalloons, .-drawBalloons
	.align	2
	.global	updateHeldBalloon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldBalloon, %function
updateHeldBalloon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #48]
	cmp	r2, #0
	bxeq	lr
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	updateHeldBalloon.part.0
	.size	updateHeldBalloon, .-updateHeldBalloon
	.comm	numBalloons,4,4
	.comm	remainingEnemies,4,4
	.comm	balloons,280,4
	.comm	player,80,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
