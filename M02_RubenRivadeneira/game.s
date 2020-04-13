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
	ldr	r3, [r0]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r0, #56]
	ldr	r1, [r0, #64]
	ldr	ip, .L4
	str	lr, [sp, #-4]!
	add	r2, r2, #1
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsl	r1, r1, #2
	add	r0, ip, r2, lsl #3
	lsl	r2, r2, #3
	strh	lr, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
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
	mov	lr, #768
	ldr	r3, [r0]
	ldr	r2, [r0, #52]
	ldr	ip, .L8
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
.L9:
	.align	2
.L8:
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
	ldr	r3, .L24
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L11
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L10
.L13:
	.word	.L15
	.word	.L16
	.word	.L14
	.word	.L15
	.word	.L14
	.word	.L12
.L18:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #3
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
.L10:
	bx	lr
.L11:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L10
.L19:
	.word	.L21
	.word	.L22
	.word	.L20
	.word	.L21
	.word	.L20
	.word	.L18
.L14:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L15:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #16
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L20:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L21:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L16:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #18
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L12:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #13
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L22:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r3, r2, #2
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r1, .L36
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #512
	ldr	r0, [r1, #72]
	ldr	r2, [r1, #64]
	ldr	r5, .L36+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, r0, lsl #5
	ldr	r4, .L36+8
	lsl	r2, r2, #2
	strh	r3, [r5, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	add	r7, r4, #240
.L29:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L27
	mov	r0, r4
	bl	drawBuzz.part.0
.L28:
	add	r4, r4, #80
	cmp	r4, r7
	bne	.L29
	mov	r7, #512
	ldr	r4, .L36+12
	add	r6, r4, #280
.L32:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L30
	mov	r0, r4
	bl	drawBalloons.part.0
.L31:
	add	r4, r4, #56
	cmp	r6, r4
	bne	.L32
	ldr	r3, .L36+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L36+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L36+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L36+24
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
.L30:
	ldr	r3, [r4, #52]
	add	r3, r5, r3, lsl #3
	strh	r7, [r3, #80]	@ movhi
	b	.L31
.L27:
	ldr	r3, [r4, #56]
	add	r3, r5, r3, lsl #3
	strh	r6, [r3, #8]	@ movhi
	b	.L28
.L37:
	.align	2
.L36:
	.word	player
	.word	shadowOAM
	.word	enemies
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
	ldr	r3, .L40
	ldr	r0, [r3]
	ldr	r3, .L40+4
	sub	r0, r1, r0
	str	r0, [r3]
	ldr	r0, .L40+8
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
.L41:
	.align	2
.L40:
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
	ldr	r4, .L64
	ldr	r3, .L64+4
	ldr	r5, [r4, #60]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #64]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #68]
	str	r1, [r4, #64]
	bne	.L43
	ldr	r0, [r4, #72]
	ldr	r3, .L64+8
	ldr	r1, [r4, #76]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #72]
.L43:
	ldr	r3, .L64+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L64+16
	streq	r3, [r2]
	ldr	r2, .L64+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #64]
	ands	r3, r3, #16
	bne	.L45
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L64+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #64]
	beq	.L46
.L47:
	ldr	r3, .L64+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L50
	ldr	r3, [r4, #64]
.L51:
	cmp	r3, #4
	bne	.L53
	mov	r3, #0
	str	r6, [r4, #64]
	str	r3, [r4, #72]
	str	r3, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldr	r2, .L64+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #64]
	streq	r2, [r4, #72]
	beq	.L53
	cmp	r2, #0
	bne	.L63
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L53:
	add	r5, r5, #1
	str	r5, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L47
	ldr	r3, .L64+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L46
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #64]
.L48:
	mov	r3, #4
	str	r3, [r4, #72]
	b	.L47
.L46:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L48
.L63:
	mov	r2, #5
	ldr	r3, [r4, #64]
	str	r2, [r4, #72]
	b	.L51
.L65:
	.align	2
.L64:
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
	ldr	r1, .L67
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #72]
	ldr	r2, [r1, #64]
	ldr	r0, .L67+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L68:
	.align	2
.L67:
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
	ldr	r2, .L114
	ldr	r3, .L114+4
	ldrh	r2, [r2, #48]
	ldr	r1, [r3, #8]
	tst	r2, #16
	push	{r4, r5, r6, r7, lr}
	str	r1, [r3, #32]
	beq	.L70
	ldr	r5, .L114+8
.L71:
	ldr	r2, .L114
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L74
	ldr	r2, [r3, #8]
	cmp	r2, #0
	blt	.L74
	ldr	ip, [r3, #16]
	ldr	r0, [r5]
	sub	r2, r2, ip
	cmp	r0, #0
	str	r2, [r3, #8]
	ble	.L74
	ldr	r2, [r3]
	cmp	r2, #59
	suble	r0, r0, ip
	strle	r0, [r5]
.L74:
	ldr	r2, .L114
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #22
	movne	r2, #30
	movne	r1, #0
	moveq	r0, #1
	streq	r2, [r3, #24]
	strne	r2, [r3, #24]
	ldr	r2, .L114
	ldrh	r2, [r2, #48]
	strne	r1, [r3, #48]
	streq	r1, [r3, #8]
	streq	r0, [r3, #48]
	ldrne	r1, [r3, #8]
	tst	r2, #64
	ldr	r2, [r3, #12]
	bne	.L78
	ldr	r0, [r3, #40]
	cmp	r0, r2
	movle	r4, #1
	ldrgt	r4, [r3, #44]
	strle	r4, [r3, #44]
.L80:
	ldr	r0, .L114+12
	ldrh	lr, [r0]
	tst	lr, #1
	ldr	r0, [r3, #52]
	beq	.L111
	ldr	ip, .L114+16
	ldrh	ip, [ip]
	ands	ip, ip, #1
	beq	.L83
.L111:
	add	r0, r0, #1
.L82:
	tst	lr, #2
	str	r0, [r3, #52]
	beq	.L91
	ldr	r0, .L114+16
	ldrh	r0, [r0]
	tst	r0, #2
	bne	.L91
	mov	r6, #1
	ldr	r0, .L114+20
	add	lr, r0, #240
.L93:
	ldr	ip, [r0, #32]
	cmp	ip, #0
	beq	.L92
	ldr	ip, [r0]
	cmp	ip, #239
	strls	r6, [r0, #52]
.L92:
	add	r0, r0, #80
	cmp	r0, lr
	bne	.L93
.L91:
	cmp	r4, #0
	bne	.L112
	ldr	r0, [r3, #40]
	cmp	r0, r2
	ldrgt	r0, [r3, #20]
	addgt	r2, r2, r0
	strgt	r2, [r3, #12]
.L94:
	ldr	r0, .L114+24
	ldr	ip, [r5]
	ldr	r0, [r0]
	sub	r1, r1, ip
	sub	r2, r2, r0
	pop	{r4, r5, r6, r7, lr}
	stm	r3, {r1, r2}
	b	animatePlayer
.L78:
	mov	r0, #0
	mov	r4, r0
	str	r0, [r3, #44]
	b	.L80
.L70:
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r2, #512
	ldr	r5, .L114+8
	bgt	.L71
	ldr	ip, .L114+28
	ldr	r0, [r5]
	ldr	r2, [r3, #16]
	cmp	r0, ip
	add	ip, r1, r2
	str	ip, [r3, #8]
	bgt	.L71
	ldr	ip, [r3]
	cmp	ip, #60
	addgt	r2, r2, r0
	strgt	r2, [r5]
	b	.L71
.L112:
	ldr	ip, [r3, #20]
	ldr	r0, [r3, #36]
	sub	r2, r2, ip
	cmp	r2, r0
	movle	r0, #0
	str	r2, [r3, #12]
	strle	r0, [r3, #44]
	b	.L94
.L83:
	cmp	r0, #9
	ble	.L111
	ldr	r7, .L114+32
	mov	r0, ip
	mov	ip, r7
.L87:
	ldr	r6, [ip, #40]
	cmp	r6, #0
	beq	.L85
	ldr	r6, [ip, #48]
	cmp	r6, #0
	bne	.L113
.L85:
	add	r0, r0, #1
	cmp	r0, #5
	add	ip, ip, #56
	bne	.L87
.L86:
	mov	r0, #1
	b	.L82
.L113:
	mov	ip, #0
	rsb	r0, r0, r0, lsl #3
	add	r0, r7, r0, lsl #3
	str	ip, [r0, #48]
	b	.L86
.L115:
	.align	2
.L114:
	.word	67109120
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	enemies
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
	ldr	r0, .L128
	mov	r2, #0
	mov	r3, r0
.L119:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L117
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L127
.L117:
	add	r2, r2, #1
	cmp	r2, #5
	add	r3, r3, #56
	bne	.L119
	bx	lr
.L127:
	mov	r3, #0
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	str	r3, [r2, #48]
	bx	lr
.L129:
	.align	2
.L128:
	.word	balloons
	.size	playerAttack, .-playerAttack
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
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #203
	mov	r2, #240
	mov	r0, r1
	mov	r9, #20
	mov	r8, #23
	mov	ip, #1
	mov	r6, #3
	ldr	r3, .L134
	ldr	lr, [r3]
	ldr	r3, .L134+4
	sub	lr, r7, lr
.L131:
	str	r1, [r3, #56]
	add	r1, r1, #1
	add	r5, r2, #58
	sub	r4, r2, #35
	cmp	r1, #3
	str	r2, [r3, #8]
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	str	r0, [r3, #32]
	str	r0, [r3, #52]
	str	r0, [r3, #48]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r7, [r3, #12]
	str	lr, [r3, #4]
	str	r6, [r3, #64]
	str	r5, [r3, #40]
	str	r4, [r3, #44]
	add	r2, r2, #30
	add	r3, r3, #80
	bne	.L131
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L135:
	.align	2
.L134:
	.word	vOff
	.word	enemies
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
	ldr	r2, [r0, #32]
	cmp	r2, #0
	bne	drawBuzz.part.0
.L137:
	mov	r2, #512
	ldr	r1, [r0, #56]
	ldr	r3, .L138
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L139:
	.align	2
.L138:
	.word	shadowOAM
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
	ldr	r9, .L175
	ldr	r2, [r0, #8]
	ldr	r3, [r9]
	sub	r3, r2, r3
	cmp	r3, #239
	mov	r4, r0
	sub	sp, sp, #20
	bhi	.L141
	ldr	r1, [r0, #36]
	cmp	r1, #0
	bne	.L141
	mov	r1, #1
	str	r3, [r0]
	str	r1, [r0, #32]
.L142:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L144
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L145
	ldr	r3, [r4, #44]
	cmp	r2, r3
	ble	.L146
	ldr	r3, [r4, #16]
	sub	r2, r2, r3
	str	r2, [r4, #8]
	ldr	r6, .L175+4
.L147:
	ldr	r5, .L175+8
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	ldr	r10, .L175+12
	ldr	fp, .L175+16
	add	r7, r5, #280
.L153:
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L151
	ldr	r8, [r5, #48]
	cmp	r8, #0
	beq	.L174
.L151:
	add	r5, r5, #56
	cmp	r5, r7
	bne	.L153
	str	r0, [sp, #8]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	add	r0, r6, #8
	ldr	r3, [r6, #24]
	ldr	r2, [r6, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r3, #0
	ldr	r0, [r4, #44]
	strne	r3, [r6, #56]
	ldr	r3, [r6, #8]
	ldr	r1, [r9]
	ldr	r2, [r4, #8]
	cmp	r3, r0
	sub	r2, r2, r1
	ldr	r0, [r4, #32]
	blt	.L155
	ldr	r1, [r4, #40]
	cmp	r3, r1
	movle	r3, #1
	strle	r3, [r4, #52]
.L155:
	ldr	r1, .L175+20
	ldr	r3, [r4, #12]
	ldr	r1, [r1]
	cmp	r0, #0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	beq	.L140
	ldr	r3, [r4, #48]
	cmp	r3, #0
	moveq	r3, #3
	streq	r3, [r4, #64]
	beq	.L140
	cmp	r3, #1
	bne	.L140
	mov	r3, #2
	str	r3, [r4, #64]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L141:
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L142
	ldr	r1, .L175+20
	ldr	r2, [r4, #12]
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
.L140:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L144:
	cmp	r3, #1
	ldr	r6, .L175+4
	bne	.L147
	ldr	r3, [r6, #8]
	cmp	r2, r3
	movlt	r3, #1
	movge	r3, #0
	str	r3, [r4, #48]
	ldr	r3, [r4, #16]
	subge	r2, r2, r3
	addlt	r2, r2, r3
	str	r2, [r4, #8]
	b	.L147
.L174:
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r2, [sp]
	str	r1, [sp, #4]
	add	r0, r5, #8
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [fp]
	strne	r8, [r5, #40]
	subne	r3, r3, #1
	strne	r2, [r4, #36]
	strne	r8, [r4, #32]
	strne	r3, [fp]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	b	.L151
.L145:
	cmp	r3, #1
	beq	.L148
.L172:
	ldr	r6, .L175+4
	b	.L147
.L146:
	mov	r3, #1
	str	r3, [r4, #48]
.L148:
	ldr	r3, [r4, #40]
	cmp	r2, r3
	ldrlt	r3, [r4, #16]
	addlt	r2, r2, r3
	strlt	r2, [r4, #8]
	blt	.L172
.L149:
	mov	r3, #0
	ldr	r6, .L175+4
	str	r3, [r4, #48]
	b	.L147
.L176:
	.align	2
.L175:
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
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bne	.L179
	mov	r3, #3
	str	r3, [r0, #64]
	bx	lr
.L179:
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #64]
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
	ldr	r9, .L189
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L189+4
	ldr	ip, .L189+8
	ldr	lr, .L189+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L187:
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
	beq	.L185
	cmp	r2, #4
	beq	.L183
.L185:
	add	r2, r2, #1
	add	r3, r3, #56
	b	.L187
.L183:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L190:
	.align	2
.L189:
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
	ldr	ip, .L193
	str	r3, [ip]
	ldr	ip, .L193+4
	str	r1, [ip]
	ldr	ip, .L193+8
	str	r1, [ip]
	ldr	ip, .L193+12
	ldr	r1, .L193+16
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	bl	initPlayer
	bl	initBuzz
	pop	{r4, lr}
	b	initBalloons
.L194:
	.align	2
.L193:
	.word	vOff
	.word	hOff
	.word	numBalloons
	.word	direction
	.word	remainingEnemies
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
	beq	.L203
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L198
	mov	r1, #0
	ldr	r2, .L204
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L197
.L198:
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	beq	.L197
	bl	updateHeldBalloon.part.0
.L203:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
.L197:
	ldr	r0, .L204+4
	ldr	r1, .L204+8
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r3, r3, r0
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L205:
	.align	2
.L204:
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
	ldr	r0, .L219
	ldr	r5, .L219+4
	bl	updateBuzz
	ldr	r0, .L219+8
	bl	updateBuzz
	ldr	r0, .L219+12
	mov	r8, r5
	mov	r4, r5
	bl	updateBuzz
	mov	r6, #0
	add	r7, r5, #280
.L208:
	mov	r0, r4
	bl	updateBalloons
	ldr	r3, [r4, #40]
	add	r4, r4, #56
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r7, r4
	bne	.L208
	cmp	r6, #4
	bgt	.L206
	mov	r3, #0
.L211:
	ldr	r2, [r5, #40]
	cmp	r2, #0
	beq	.L218
	add	r3, r3, #1
	cmp	r3, #5
	add	r5, r5, #56
	bne	.L211
.L206:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L218:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #3
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L220:
	.align	2
.L219:
	.word	enemies
	.word	balloons
	.word	enemies+80
	.word	enemies+160
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
.L222:
	mov	r2, #512
	ldr	r1, [r0, #52]
	ldr	r3, .L223
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #80]	@ movhi
	bx	lr
.L224:
	.align	2
.L223:
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
	.comm	enemies,240,4
	.comm	player,80,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
